# == Schema Information
#
# Table name: sources
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  url            :string(255)
#  WebSearch      :boolean
#  DatabaseSearch :boolean
#  LibrarySearch  :boolean
#  Interview      :boolean
#  created_at     :datetime
#  updated_at     :datetime
#  Survey         :boolean
#

class Source < ActiveRecord::Base
  scope :with_category, -> (category) { where(category => true) }

  attr_accessible :title, :url, :WebSearch, :DatabaseSearch, :LibrarySearch, :Interview, :Survey
  default_scope { order('created_at ASC') }
  validates :title,  presence: true, length: { maximum: 50 }
end
