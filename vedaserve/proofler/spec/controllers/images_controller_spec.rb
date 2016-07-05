require 'rails_helper'

RSpec.describe ImagesController do
  describe '.create' do
    let(:latest_image) { @decision.options.first.images.all.last }
    it 'adds the image to the option' do
      @decision = create(:valued_decision)
      @decision.options.reload
      @token = @decision.admin.invitation_token
      post :create, dashboard_token: @token, image:
        {
          title: 'hello',
          option_id: @decision.options.first.id
        }

      expect(response).to redirect_to dashboard_path(@decision.admin.invitation_token)
      expect(latest_image.title).to eql('hello')
    end
  end
end
