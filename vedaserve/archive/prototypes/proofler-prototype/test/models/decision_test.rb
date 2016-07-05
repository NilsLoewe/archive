# == Schema Information
#
# Table name: decisions
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  description   :string(255)
#  email         :string(255)
#  author        :string(255)
#  closed        :boolean
#  chosen_option :integer
#  user_id       :integer
#  state         :string(255)
#  ratio         :integer
#  cloned        :boolean
#  clone_id      :integer
#  facts_enabled :boolean
#

require 'test_helper'

class DecisionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
