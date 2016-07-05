require "rails_helper"

RSpec.describe "Updating a fact", type: :feature, js: true do
  let!(:decision) { create(:decision, :with_facts, facts_count: 1, options_count: 1) }
  let!(:admin) { decision.admin }
  let(:first_assignment) { decision.assignments.first }

  it "updates the title of a fact" do
    visit dashboard_path(token: admin.invitation_token)

    within(".option-fact-name") do
      find("button.dropdown-toggle").click
      edit_link.click
    end

    # The page reloads. That's why there is another "within" block.
    within(".modal-content") do
      find('#fact_title').set('Wert')
      find(".btn").click
    end

    expect(page).to have_content('Wert')
  end

  private

  def edit_link
    find('.editLink a')
  end
end
