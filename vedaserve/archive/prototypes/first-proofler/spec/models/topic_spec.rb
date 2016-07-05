# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  research_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Topic do

  let(:research) { FactoryGirl.create(:research) }
  before do
   @topic = research.topics.build(title: "One Topic")
  end

  subject { @topic }

  it { should respond_to(:title) }
  it { should respond_to(:research) }
  its(:research) { should == research }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to research_id" do
      expect do
        Topic.new(research_id: research.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when research_id is not present" do
    before { @topic.research_id = nil }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @topic.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @topic.title = "a" * 51 }
    it { should_not be_valid }
  end

end
