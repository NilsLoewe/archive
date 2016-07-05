# == Schema Information
#
# Table name: hats
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#  priority    :integer
#

require 'spec_helper'

describe Hat do

  let(:user) { FactoryGirl.create(:user) }
  before { @hat = user.hats.build(title: "My hat") }

  subject { @hat }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:user_id) }

  it { should be_valid }

end
