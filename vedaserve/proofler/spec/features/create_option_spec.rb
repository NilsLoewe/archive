require "rails_helper"

RSpec.describe "Creating an option", type: :feature, js: true do
  before(:each) do
    @decision = FactoryGirl.create(:decision)
  end

  scenario 'add the first option' do
    visit dashboard_path(token: @decision.admin.invitation_token)
    find('.js-new-option').click

    find('#option_title').set('Test all the things')
    click_button(I18n.t('option.create'))

    expect(page).to have_content 'Test all the things'
  end
end
