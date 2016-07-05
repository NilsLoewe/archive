# == Schema Information
#
# Table name: fact_ratings
#
#  id             :integer          not null, primary key
#  value          :float
#  fact_id        :integer
#  participant_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class FactRating < ActiveRecord::Base
  belongs_to :fact
  belongs_to :participant

  validates :participant, presence: true
  validates :fact, presence: true
  validates_uniqueness_of :fact_id, scope: :participant_id
end
