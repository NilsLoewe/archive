require "rails_helper"

RSpec.describe "Updating an assignment", type: :feature, js: true do
  let!(:decision) { create(:decision, :with_facts, facts_count: 1, options_count: 1) }
  let!(:admin) { decision.admin }
  let(:first_assignment) { decision.assignments.first }

  it "assigning a value to an unassigned fact" do
    visit dashboard_path(token: admin.invitation_token)

    find('#assignment_value').set('Wert')
    find('#assignment_value').trigger('blur')

    visit dashboard_path(token: admin.invitation_token)
    expect(page).to have_content('Wert')
  end
end
