# == Schema Information
#
# Table name: visions
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Vision do

  before do
    @vision = Vision.new(description: "I have a dream...")
  end

  subject { @vision }

  it { should respond_to(:description) }

  it { should be_valid }


  describe "description may be empty" do
    before { @vision.description = nil }
    it { should be_valid }
  end

end
