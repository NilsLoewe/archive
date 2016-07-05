# == Schema Information
#
# Table name: searches
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  type        :string(255)
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Search do

  let(:question) { FactoryGirl.create(:question) }
  before do
    @search = question.searches.build(title: "What a result")
  end

  subject { @search }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:type) }
  it { should respond_to(:question) }
  its(:question) { should == question }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to question_id" do
      expect do
        Search.new(question_id: question.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when question_id is not present" do
    before { @search.question_id = nil }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @search.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @search.title = "a" * 51 }
    it { should_not be_valid }
  end
  
end
