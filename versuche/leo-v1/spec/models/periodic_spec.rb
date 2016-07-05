# == Schema Information
#
# Table name: periodics
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  category_id :integer
#  user_id     :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Periodic do

  let(:category) { FactoryGirl.create(:category) }
  before { @periodic = category.periodics.create(title: "My periodic") }

  subject { @periodic }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:category_id) }
  its(:category) { should == category }
  its(:title) { should == "My periodic" }

  it { should be_valid }

  describe "when category_id is not present" do
    before { @periodic.category_id = nil }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @periodic.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @periodic.title = "a" * 51 }
    it { should_not be_valid }
  end  
end
