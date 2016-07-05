require 'spec_helper'
require 'devise/test_helpers'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit new_user_session_path }

    it { should have_selector('h1',    text: 'Sign in') }
    it { should have_selector('title', text: 'Sign in') }
  end

  describe "signin" do
    before { visit new_user_session_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div', text: 'Invalid email or password') }

      describe "after visiting another page" do
        before { click_link "Help" }
        it { should_not have_selector('p', text: 'Invalid email or password') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_selector('title', text: full_title('Home')) }

      it { should have_link('My Account', href: edit_user_registration_path) }
      it { should have_link('Logout', href: destroy_user_session_path) }
      it { should_not have_link('Login', href: new_user_session_path) }
      it { should_not have_link('Register', href: new_user_registration_path) }
    end
  end

  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_registration_path
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "Sign in"
        end

        describe "after signing in" do

          it "should render the desired protected page" do
            page.should have_selector('title', text: 'Edit User')
          end
        end
      end

      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_registration_path }
          it { should have_selector('title', text: 'Sign in') }
        end
      end
    end

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user }

      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('title', text: full_title('Edit user')) }
      end
    end
  end
end
