require 'rails_helper'

RSpec.describe ParticipantsController do
  let!(:decision) { create(:decision) }

  describe '.new' do
    it 'renders the correct template' do
      xhr :get, :new, dashboard_token: decision.admin.invitation_token
      expect(response).to render_template('participants/new')
    end
  end

  describe '.create' do
    it 'creates a valid decision' do
      expect do
        xhr :post, :create, dashboard_token: decision.admin.invitation_token,
                            participant: { name: 'hans', email: 'hans@hansundgabi.de' }
      end.to change { decision.participants.count }.by(1)
    end

    it 'informs the postman' do
      expect_any_instance_of(Participant).to receive(:subscribe).with(Postman)

      xhr :post, :create, dashboard_token: decision.admin.invitation_token,
                          participant: { name: 'hans', email: 'hans@hansundgabi.de' }
    end
  end
end
