require "rails_helper"

RSpec.describe "Creating a fact", type: :feature, js: true do
  let!(:decision) { FactoryGirl.create(:decision, :with_created_options) }
  let!(:participant) { FactoryGirl.create(:participant, decision: decision) }
  let(:admin) { decision.admin }
  let(:first_option) { decision.options.limit(1).first }

  it "admin can add a fact to an option" do
    visit dashboard_path(token: admin.invitation_token)

    find("#addfact#{first_option.id}").click
    fill_in('Titel', with: 'Epicness')
    click_button(I18n.t('fact.create'))

    first_option.assignments.each do |assignment|
      expect(find("#fact_assignment_#{assignment.id}").value).to eq "Epicness"
    end
  end

  it "participant can add a fact to an option" do
    visit dashboard_path(token: participant.invitation_token)

    find("#addfact#{first_option.id}").click
    fill_in('Titel', with: 'Epicness')
    click_button(I18n.t('fact.create'))

    first_option.assignments.each do |assignment|
      expect(find("#fact_assignment_#{assignment.id}").value).to eq "Epicness"
    end
  end
end
