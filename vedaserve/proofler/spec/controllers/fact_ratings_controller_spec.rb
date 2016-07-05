require 'rails_helper'

RSpec.describe FactRatingsController do
  describe '.update' do
    let(:latest_rating) { @fact_rating.fact.fact_ratings.all.last }
    it 'updates the rating' do
      @fact_rating = create(:fact_rating)
      @token = @fact_rating.fact.decision.admin.invitation_token
      put :update, id: @fact_rating.id, dashboard_token: @token, fact_rating: { value: '3' }

      expect(response).to redirect_to dashboard_path(@fact_rating.fact.decision.admin.invitation_token)
      expect(latest_rating.value).to eql(3.0)
    end
  end
end
