require 'rails_helper'

RSpec.describe DecisionsController do
  before do
    # only test the integration with Postman
    expect_any_instance_of(Decision).to receive(:subscribe).with(Postman)

    # don't intercept the callbacks needed for the controller
    allow_any_instance_of(Decision).to receive(:subscribe).with(DecisionsController).and_call_original
  end

  describe '.create' do
    context 'successful' do
      before do
        xhr :post, :create, decision: { title: 'foo', admin_attributes: { name: 'name', email: 'test@example.com' } }
      end

      it 'stores the decision' do
        expect(response.code).to eql('200')
        expect(assigns(:decision).persisted?).to eql(true)
      end

      it 'responds with javascript' do
        # expect(response).to render_template('decisions/create') # TODO: Check for redirect to correct path here
        expect(response.content_type).to eql('text/javascript')
      end
    end

    context 'failure' do
      it 'does not respond to HTML requests' do
        expect do
          post :create, decision: { title: 'bar' }
        end.to raise_exception(ActionController::UnknownFormat)
      end

      it 'responds with javascript in error case' do
        xhr :post, :create, decision: { title: '' }

        expect(assigns(:decision)).to_not be_persisted
        expect(response.code).to eql('200')
        expect(response).to render_template('decisions/create')
      end
    end
  end
end
