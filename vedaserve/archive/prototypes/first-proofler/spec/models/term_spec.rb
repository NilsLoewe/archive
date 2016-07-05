# == Schema Information
#
# Table name: terms
#
#  id          :integer          not null, primary key
#  term        :string(255)
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Term do
  let(:question) { FactoryGirl.create(:question) }
  before do
   @term = question.terms.build(term: "One Term")
  end

  subject { @term }

  it { should respond_to(:term) }
  it { should respond_to(:question) }
  its(:question) { should == question }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to question_id" do
      expect do
        Topic.new(question_id: question.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when question_id is not present" do
    before { @term.question_id = nil }
    it { should_not be_valid }
  end

  describe "when term is not present" do
    before { @term.term = " " }
    it { should_not be_valid }
  end

  describe "when term is too long" do
    before { @term.term = "a" * 51 }
    it { should_not be_valid }
  end

end
