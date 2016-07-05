# == Schema Information
#
# Table name: facts
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  decision_id :integer
#  neg         :boolean
#  description :string(255)
#  type        :string(255)
#

require 'test_helper'

class FactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
