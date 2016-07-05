require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup" do

    before { visit new_user_registration_path }

    let(:submit) { "Sign up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "error messages" do
        before { click_button submit }

        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "John Doe"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar23"
        fill_in "Password confirmation", with: "foobar23"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "should confirm the user" do
        before { click_button submit }

        let(:user) { User.find_by_email('user@example.com') }

        it { should have_content('A message with a confirmation link has been sent to your email address') }
        it { should have_link('Login') }
      end
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in(user)
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_selector('h1',    text: "Edit User") }
      it { should have_selector('title', text: "Edit User") }
    end

    describe "with invalid information" do
      before { click_button "Update" }

      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Password confirmation", with: user.password
        fill_in "Current password", with: user.password
        click_button "Update"
      end

      it { should have_content('You updated your account successfully') }
      it { should have_link('Logout', href: destroy_user_session_path) }
    end
  end

end
