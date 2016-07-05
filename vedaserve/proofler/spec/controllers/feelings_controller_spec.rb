require 'rails_helper'

RSpec.describe FeelingsController do
  describe '.update' do
    let(:latest_feeling) { @feeling.option.feelings.all.last }
    it 'updates the feeling' do
      @feeling = create(:feeling)
      @token = @feeling.option.decision.admin.invitation_token
      put :update, id: @feeling.id, dashboard_token: @token, feeling: { value: '3' }

      expect(response).to redirect_to dashboard_path(@feeling.option.decision.admin.invitation_token)
      expect(latest_feeling.value).to eql(3.0)
    end
  end
end
