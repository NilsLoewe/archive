# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  color      :integer
#  position   :integer
#

require 'spec_helper'

describe Category do

  let(:user) { FactoryGirl.create(:user) }
  before { @category = user.categories.build(title: "My Category") }

  subject { @category }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:color) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Category.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_id is not present" do
    before { @category.user_id = nil }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @category.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @category.title = "a" * 51 }
    it { should_not be_valid }
  end

  describe "objective associations" do

    before { @category.save }

    let!(:older_objective) do
      FactoryGirl.create(:objective, category: @category, created_at: 1.day.ago)
    end

    it "should destroy associated objectives" do
      objectives = @category.objectives.dup
      @category.destroy
      objectives.should_not be_empty
      objectives.each do |objective|
        Objective.find_by_id(objective.id).should be_nil
      end
    end
  end
  
end
