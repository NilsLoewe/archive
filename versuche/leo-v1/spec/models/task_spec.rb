# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  plan_id      :integer
#  status       :string(255)
#  size         :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  done         :boolean
#  content      :text
#  week         :integer
#  current_week :boolean
#  plan_type    :string(255)
#  sprint       :boolean
#

require 'spec_helper'

describe Task do

  let(:objective) { FactoryGirl.create(:objective) }
  before { @task = objective.tasks.create(title: "My Task") }

  subject { @task }

  it { should respond_to(:title) }
  it { should respond_to(:plan_id) }
  it { should respond_to(:plan_type) }
  it { should respond_to(:content) }
  it { should respond_to(:done) }
  it { should respond_to(:size) }
  its(:plan) { should == objective }
  its(:title) { should == "My Task" }
  its(:done) { should == false }
  its(:week) { should == 0 }

  it { should be_valid }

  describe "when plan_id is not present" do
    before { @task.plan_id = nil }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @task.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @task.title = "a" * 51 }
    it { should_not be_valid }
  end

end
