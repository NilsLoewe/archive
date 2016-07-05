require 'rails_helper'

RSpec.describe FactsController do
  describe '.create' do
    let(:latest_fact) { @decision.facts.all.last }
    it 'adds the fact to the decision' do
      @decision = create(:decision)
      @token = @decision.admin.invitation_token
      xhr :post, :create, dashboard_token: @token, fact:
        {
          title: 'bar',
          creator: @decision.admin.id,
          decision: @decision.id,
          datatype: 'BOOLEAN'
        }

      expect(response.code).to eql('200')
      expect(latest_fact.title).to eql('bar')
      expect(latest_fact.creator_id).to eql(@decision.admin.id)
    end
  end

  describe '.update' do
    let(:latest_fact) { @fact.decision.facts.all.last }
    it 'updates the fact' do
      @fact = create(:fact)
      @token = @fact.decision.admin.invitation_token
      put :update, id: @fact.id, dashboard_token: @token, fact: { title: 'blubb' }

      expect(response).to redirect_to dashboard_path(@fact.decision.admin.invitation_token)
      expect(latest_fact.title).to eql('blubb')
    end
  end
end
