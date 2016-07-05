require 'rails_helper'

RSpec.describe AssignmentsController do
  describe '.update' do
    let!(:decision) { create(:decision, :with_facts, facts_count: 1, options_count: 1) }
    let!(:latest_assignment) { decision.assignments.last }
    let(:token) { decision.admin.invitation_token }

    it 'updates the assignment' do
      put :update, id: latest_assignment.id, dashboard_token: token, assignment: { value: 'yes' }

      expect(response).to redirect_to dashboard_path(token)
      expect(latest_assignment.reload.value).to eql('yes')
    end
  end
end
