# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  color      :integer
#  position   :integer
#

class Category < ActiveRecord::Base

  attr_accessible :content, :title, :color, :position
  belongs_to :user

  has_many :objectives, dependent: :destroy
  has_many :periodics, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
  default_scope { order('position ASC')}
  acts_as_list scope :cat_list
end
