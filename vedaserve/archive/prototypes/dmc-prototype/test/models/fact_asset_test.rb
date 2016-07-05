# == Schema Information
#
# Table name: fact_assets
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  fact_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class FactAssetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
