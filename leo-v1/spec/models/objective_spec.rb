# == Schema Information
#
# Table name: objectives
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :text
#  category_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  status       :string(255)
#  sprint_end   :date
#  sprint_start :date
#  duration     :integer
#  sprinttitle  :string(255)
#  archive      :boolean
#  parked       :boolean
#  simple       :boolean
#

require 'spec_helper'

describe Objective do

  let(:category) { FactoryGirl.create(:category) }
  before { @objective = category.objectives.create(title: "My Objective") }

  subject { @objective }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:category_id) }
  it { should respond_to(:status) }
  its(:category) { should == category }
  its(:title) { should == "My Objective" }
  its(:status) { should == "planning" }

  it { should be_valid }

  describe "when category_id is not present" do
    before { @objective.category_id = nil }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @objective.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @objective.title = "a" * 51 }
    it { should_not be_valid }
  end

  describe "status" do

    describe "planning" do
      it "should be in planning mode" do
        @objective.planning?.should be_true
        @objective.sprint_running?.should be_false
        @objective.sprint_finished?.should be_false
      end
    end

    describe "sprint" do

      before { @objective.sprint_running! }

      it "should be in running mode" do
        @objective.planning?.should be_false
        @objective.sprint_running?.should be_true
        @objective.sprint_finished?.should be_false
      end
    end

    describe "finished" do

      before { @objective.sprint_finished! }

      it "should be in waiting mode" do
        @objective.planning?.should be_false
        @objective.sprint_running?.should be_false
        @objective.sprint_finished?.should be_true
      end
    end
  end

  describe "task associations" do

    before { @objective.save }

    let!(:older_task) do
      FactoryGirl.create(:objective_task, plan: @objective, created_at: 1.day.ago)
    end

    it "should destroy associated tasks" do
      tasks = @objective.tasks.dup
      @objective.destroy
      tasks.should_not be_empty
      tasks.each do |task|
        Task.find_by_id(task.id).should be_nil
      end
    end
  end
end
