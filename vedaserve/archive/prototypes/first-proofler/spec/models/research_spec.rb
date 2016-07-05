# == Schema Information
#
# Table name: researches
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'spec_helper'

describe Research do

  let(:user) { FactoryGirl.create(:user) }
  before { @research = user.researches.build(title: "My research") }

  subject { @research }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Research.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_id is not present" do
    before { @research.user_id = nil }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @research.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @research.title = "a" * 51 }
    it { should_not be_valid }
  end

end
