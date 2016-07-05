# == Schema Information
#
# Table name: questions
#
#  id                             :integer          not null, primary key
#  title                          :string(255)
#  enable                         :boolean
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  custom                         :boolean
#  topic_id                       :integer
#  research_web                   :boolean          default(FALSE), not null
#  research_database              :boolean          default(FALSE), not null
#  research_library               :boolean          default(FALSE), not null
#  research_interview             :boolean          default(FALSE), not null
#  short_answer                   :string(255)
#  answer                         :text
#  configured_research_categories :text
#  thoughts                       :text
#

require 'spec_helper'

describe Question do

  let(:topic) { FactoryGirl.create(:topic) }
  before do
    @question = topic.questions.build(title: "One Question")
  end

  subject { @question }

  it { should respond_to(:title) }
  it { should respond_to(:enable) }
  it { should respond_to(:custom) }
  it { should respond_to(:topic) }
  its(:topic) { should == topic }

  it { should be_valid }

  describe "when topic_id is not present" do
    before { @question.topic_id = nil }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @question.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @question.title = "a" * 151 }
    it { should_not be_valid }
  end

  describe "knows which research categories are configured" do
    before { @question.research_categories = ['random_result'] }
    it { should be_valid }
  end

  describe "saves an empty list if no research categories are configured" do
    before { @question.research_categories = nil }
    it { expect(@question.research_categories).to eql([]) }
  end

  describe "sorts the configured research categories" do
    before { @question.research_categories = ['b', 'a'] }
    it { expect(@question.research_categories).to eql(['a', 'b']) }
  end

end
