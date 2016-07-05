# == Schema Information
#
# Table name: hints
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  lang         :string(255)
#  text         :text
#  created_at   :datetime
#  updated_at   :datetime
#  tag          :string(255)
#  note         :string(255)
#  show_title   :boolean
#  show_disable :boolean
#

class Hint < ActiveRecord::Base
  scope :with_tag, -> (tag) { where(:tag => tag).first }

  attr_accessible :title, :lang, :text, :tag, :note, :show_title, :show_disable
  validates :title,  presence: true, length: { maximum: 50 }

end
