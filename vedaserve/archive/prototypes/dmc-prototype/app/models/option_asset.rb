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

class OptionAsset < ActiveRecord::Base
  belongs_to :option
  before_save :sanitize_link

  private
    def sanitize_link
      if description_changed?
        self.description = "http://#{description}" unless description =~ /^https?:\/\//
      end
    end 
end
