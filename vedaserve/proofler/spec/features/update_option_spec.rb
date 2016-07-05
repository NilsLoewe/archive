require "rails_helper"

RSpec.describe "Updating an option", type: :feature, js: true do
  let!(:decision) { create(:decision) }

  shared_examples "edit fields" do
    it "it's title can be changed for own options" do
      visit dashboard_path(token: editor.invitation_token)

      find(edit_option_title(option.id)).click
      page.first(:fillable_field, 'title').set('tea')

      expect(page).to have_css(option_title(option.id), text: 'tea')
    end

    it "it's description can be changed for own options" do
      visit dashboard_path(token: editor.invitation_token)

      find(edit_option_description(option.id)).click
      page.first(:fillable_field, 'description').set('tea is great')

      expect(page).to have_css(option_description(option.id), text: 'tea is great')
    end
  end

  context "admin" do
    let!(:editor) { create(:participant, decision: decision) }
    let!(:option) do
      create(:option,
             decision: decision,
             title: 'coffee',
             description: 'coffee is the best',
             creator: editor)
    end

    it_behaves_like "edit fields"
  end

  context "participant" do
    let!(:editor) { decision.admin }
    let!(:option) do
      create(:option,
             decision: decision,
             title: 'Club Mate',
             description: 'mate, mate, mate!',
             creator: editor)
    end

    it_behaves_like "edit fields"
  end
end
