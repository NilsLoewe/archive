# == Schema Information
#
# Table name: option_assets
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  option_id   :integer
#

require 'test_helper'

class OptionAssetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
