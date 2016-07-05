require 'spec_helper'
require 'devise/test_helpers'

describe "Research pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:research) { FactoryGirl.create(:research) }

  describe "without logged in user" do
    before { visit root_path }

    describe "should not have a 'My Researches' link" do
      it { should_not have_content('My Researches') }
    end
  end

  describe "with logged in user" do
    before { visit root_path }
    before { sign_in user }

    describe "should have a 'My Researches' link" do
      it { should have_content('My Researches') }
    end

  end
end
