# == Schema Information
#
# Table name: dataobjects
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  type       :string(255)
#  content    :string(255)
#  search_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  useful     :boolean
#  highlight  :boolean
#  reviewed   :boolean
#  note       :text
#  rating     :integer
#  score      :integer
#

require 'spec_helper'

describe Dataobject do

  let(:search) { FactoryGirl.create(:search) }
  before do
    @dataobject = search.dataobjects.build(title: "What a cool dataobject")
  end

  subject { @dataobject }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:type) }
  it { should respond_to(:search) }
  its(:search) { should == search }

  it { should be_valid }

  describe "when search_id is not present" do
    before { @dataobject.search_id = nil }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @dataobject.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @dataobject.title = "a" * 51 }
    it { should_not be_valid }
  end

end
