# == Schema Information
#
# Table name: sources
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  url            :string(255)
#  WebSearch      :boolean
#  DatabaseSearch :boolean
#  LibrarySearch  :boolean
#  Interview      :boolean
#  created_at     :datetime
#  updated_at     :datetime
#  Survey         :boolean
#

require 'spec_helper'

describe Source do

  before do
   @source = Source.new(title: "One Source")
  end

  subject { @source }

  it { should respond_to(:title) }
  it { should respond_to(:url) }

  it { should be_valid }

  describe "when title is not present" do
    before { @source.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @source.title = "a" * 51 }
    it { should_not be_valid }
  end

end
