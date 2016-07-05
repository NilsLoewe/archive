# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  comment     :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  decision_id :integer
#  option_id   :integer
#  title       :string(255)
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
