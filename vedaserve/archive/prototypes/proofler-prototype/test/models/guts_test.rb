# == Schema Information
#
# Table name: guts
#
#  id         :integer          not null, primary key
#  option_id  :integer
#  user_id    :integer
#  value      :integer
#  created_at :datetime
#  updated_at :datetime
#  unset      :boolean          default(TRUE)
#

require 'test_helper'

class GutsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
