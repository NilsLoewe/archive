# == Schema Information
#
# Table name: hints
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  lang         :string(255)
#  text         :text
#  created_at   :datetime
#  updated_at   :datetime
#  tag          :string(255)
#  note         :string(255)
#  show_title   :boolean
#  show_disable :boolean
#

require 'spec_helper'

describe Hint do

  before do
   @hint = Hint.new(title: "One Help")
  end

  subject { @hint }

  it { should respond_to(:title) }
  it { should respond_to(:lang) }
  it { should respond_to(:text) }

  it { should be_valid }

  describe "when title is not present" do
    before { @hint.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @hint.title = "a" * 51 }
    it { should_not be_valid }
  end

end
