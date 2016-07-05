require "rails_helper"

RSpec.describe "add participants", type: :feature, js: true do
  let(:decision) { create(:decision) }

  scenario 'invite first participant' do
    visit dashboard_path(token: decision.admin.invitation_token)
    find('#invite-link').click

    fill_in("participant_name", with: 'Hans Wurst')
    fill_in("participant_email", with: 'foo@bar.com')
    click_button("Einladen")

    expect(page).to have_css('.user', text: 'Hans Wurst')
  end
end
