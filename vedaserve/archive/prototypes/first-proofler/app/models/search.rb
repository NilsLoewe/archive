# == Schema Information
#
# Table name: searches
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  type        :string(255)
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Search < ActiveRecord::Base
  attr_accessible :title, :description
  belongs_to :question
  has_many :dataobjects
  default_scope { order('created_at DESC') }

  scope :with_type, -> (type) { where(type: type)}

  validates :title,  presence: true, length: { maximum: 50 }
  validates :question_id, presence: true

  def self.categories
    descendants.map { |c| c.to_s }.sort
  end
end
