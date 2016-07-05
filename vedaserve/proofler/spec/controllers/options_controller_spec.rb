require 'rails_helper'

RSpec.describe OptionsController do
  describe '.create' do
    let(:latest_option) { @decision.options.all.last }
    it 'adds the option to the decision' do
      @decision = create(:decision)
      @token = @decision.admin.invitation_token
      xhr :post, :create, dashboard_token: @token, option: { title: 'foo' }

      expect(response.code).to eql('200')
      expect(latest_option.title).to eql('foo')
      expect(latest_option.creator_id).to eql(@decision.admin.id)
    end
  end

  describe '.update' do
    let(:latest_option) { @option.decision.options.all.last }
    it 'updates the option' do
      @option = create(:option)
      @token = @option.decision.admin.invitation_token
      put :update, id: @option.id, dashboard_token: @token, option: { title: 'blubb' }

      expect(response).to redirect_to dashboard_path(@option.decision.admin.invitation_token)
      expect(latest_option.title).to eql('blubb')
    end
  end
end
