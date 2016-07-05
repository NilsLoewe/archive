require "rails_helper"

RSpec.describe "the signin process", type: :feature, js: true do
  let(:check_your_email_text) do
    html = I18n.t('decision.check_your_email_html', email: 'test@example.com')
    ActionView::Base.full_sanitizer.sanitize(html)
  end

  scenario 'creating a decision' do
    visit root_path

    fill_in 'decision_title', with: 'My decision'
    fill_in 'decision_admin_attributes_name', with: 'My Name'
    fill_in 'decision_admin_attributes_email', with: 'test@example.com'

    find('#create_decision').trigger('click')

    expect(page).to have_content 'My decision'
  end
end
