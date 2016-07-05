# == Schema Information
#
# Table name: fact_ratings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  fact_id    :integer
#  value      :integer
#  created_at :datetime
#  updated_at :datetime
#  unset      :boolean          default(TRUE)
#

require 'test_helper'

class FactRatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
