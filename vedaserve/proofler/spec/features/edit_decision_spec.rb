require 'rails_helper'

RSpec.describe 'edit a decision', type: :feature, js: true do
  let!(:decision) { FactoryGirl.create(:decision) }
  let!(:participant) { FactoryGirl.create(:participant, decision: decision) }
  let(:admin) { decision.admin }

  scenario 'admin changes the decision title' do
    visit dashboard_path(token: admin.invitation_token)
    expect(page).to have_css('.decision-title', text: 'New Decision')

    edit_link.click

    page.first(:fillable_field, 'title').set("updated-title")

    expect(page).to have_css('.decision-title', text: 'updated-title')
  end

  scenario 'participant can not change the decision title' do
    visit dashboard_path(token: participant.invitation_token)
    expect(page).to have_css('.decision-title', text: 'New Decision')

    expect { edit_link }.to raise_error Capybara::ElementNotFound
  end

  private

  def edit_link
    find('.decision-title .edit')
  end
end
