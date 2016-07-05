# == Schema Information
#
# Table name: options
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  decision_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  rated       :boolean
#  selected    :boolean
#  description :string(255)
#

require 'test_helper'

class OptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
