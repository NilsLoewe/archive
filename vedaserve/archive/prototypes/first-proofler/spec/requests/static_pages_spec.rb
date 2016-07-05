require 'spec_helper'

describe 'Static pages' do

  subject { page }

  describe 'Home page' do
    before { visit root_path }

    it { should have_selector('h1', text: 'Proofler') }
    it { should have_selector('title', text: full_title('Home')) }
  end

  describe 'Help page' do

    before { visit help_path }

    it { should have_selector('h1', text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }

  end
end