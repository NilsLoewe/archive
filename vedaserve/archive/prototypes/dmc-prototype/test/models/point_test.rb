# == Schema Information
#
# Table name: points
#
#  id             :integer          not null, primary key
#  fact_id        :integer
#  participant_id :integer
#  value          :integer
#  created_at     :datetime
#  updated_at     :datetime
#  user_id        :integer
#

require 'test_helper'

class PointTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
