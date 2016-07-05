# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  research_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Topic < ActiveRecord::Base
  attr_accessible :title
  belongs_to :research
  has_many :questions, dependent: :destroy

  validates :title,  presence: true, length: { maximum: 50 }
  validates :research_id, presence: true
end
