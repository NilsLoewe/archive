# == Schema Information
#
# Table name: allocations
#
#  id         :integer          not null, primary key
#  option_id  :integer
#  fact_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  direction  :boolean
#  question   :boolean
#  relevant   :boolean
#  value      :string(255)
#

require 'test_helper'

class AllocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
