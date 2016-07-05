# == Schema Information
#
# Table name: dataobjects
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  type       :string(255)
#  content    :string(255)
#  search_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  useful     :boolean
#  highlight  :boolean
#  reviewed   :boolean
#  note       :text
#  rating     :integer
#  score      :integer
#

class Dataobject < ActiveRecord::Base
  attr_accessible :title, :content, :type, :search_id, :useful, :highlight, :rating, :score, :note
  belongs_to :search
  default_scope { order('score DESC') }
  scope :unscored, -> { where(score: "0") }
  scope :scored,   -> { where(score: "0") }

  validates :title,  presence: true, length: { maximum: 50 }
  validates :search_id, presence: true

  def self.types
    descendants.map { |c| c.to_s }.sort
  end
end
