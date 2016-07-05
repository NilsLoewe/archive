require 'rails_helper'

RSpec.describe DashboardsController do
  describe '.show' do
    before(:each) do
      @decision = create(:decision)
      @token = @decision.admin.invitation_token
    end

    # The initial state for a decision is 'gather'
    it 'with empty decision renders "gather"' do
      get :show, token: @token
      expect(assigns(:partial)).to eql('gather')
    end

    # When the state was changed to 'rate', the partial depends on the status
    # of the fact_ratings and the feelings.
    describe 'in rating state' do
      # With unrated facts, the view should show the next fact_rating
      it 'with facts renders "rate"' do
        @decision = create(:decision, :rating, :with_facts)
        @token = @decision.admin.invitation_token
        get :show, token: @token
        expect(assigns(:partial)).to eql('rate')
      end

      # With rated facts, the view should directly show the next feeling
      it 'without facts renders "feeling"' do
        @decision = create(:rated_decision, :with_created_options)
        @decision.admin.fact_ratings.reload
        @decision.admin.fact_ratings.first.value = 3
        @decision.admin.fact_ratings.first.save
        @token = @decision.admin.invitation_token
        get :show, token: @token
        expect(assigns(:partial)).to eql('feel')
      end

      # Without facts, the view should directly show the next feeling
      it 'without facts renders "feeling"' do
        @decision = create(:decision, :rating, :with_created_options)
        @token = @decision.admin.invitation_token
        get :show, token: @token
        expect(assigns(:partial)).to eql('feel')
      end

      # Without facts and options, the view should show the decide view
      it 'without facts renders "feeling"' do
        @decision = create(:valued_decision)
        @decision.admin.feelings.reload
        @decision.admin.feelings.first.value = 3
        @decision.admin.feelings.first.save
        @token = @decision.admin.invitation_token
        get :show, token: @token
        expect(assigns(:partial)).to eql('decide')
      end

      # Without facts and options, the view should show the decide view
      it 'without facts renders "feeling"' do
        @decision = create(:decision, :rating)
        @token = @decision.admin.invitation_token
        get :show, token: @token
        expect(assigns(:partial)).to eql('decide')
      end

      # With favourite set, the admin should see the decide view
      it 'without favourite set as admin renders "favourite"' do
        @decision = create(:valued_decision)
        @decision.admin.feelings.reload
        @decision.admin.feelings.first.value = 3
        @decision.admin.feelings.first.favourite = true
        @decision.admin.feelings.first.save
        @token = @decision.admin.invitation_token
        get :show, token: @token
        expect(assigns(:partial)).to eql('decide')
      end

      # With favourite set, a participant should see the pending view
      it 'without favourite set as participant renders "favourite"' do
        @decision = create(:valued_decision)
        @decision.participants.second.feelings.reload
        @decision.participants.second.feelings.first.value = 3
        @decision.participants.second.feelings.first.favourite = true
        @decision.participants.second.feelings.first.save
        @token = @decision.participants.second.invitation_token
        get :show, token: @token
        expect(assigns(:partial)).to eql('pending')
      end
    end

    # When the state was changed to closed, the selected option is shown
    it 'with closed decision renders "closed"' do
      @decision = create(:closed_decision, :with_created_options)
      @decision.options.reload
      @token = @decision.admin.invitation_token
      get :show, token: @token
      expect(assigns(:partial)).to eql('closed')
      expect(assigns(:option)).to_not eql(nil)
    end
  end
end
