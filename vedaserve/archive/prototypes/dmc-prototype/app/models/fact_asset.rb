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

class FactAsset < ActiveRecord::Base
  belongs_to :fact
end
