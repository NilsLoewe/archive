# == Schema Information
#
# Table name: facts
#
#  id          :integer          not null, primary key
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  decision_id :integer
#  creator_id  :integer
#  datatype    :string
#

class Fact < ActiveRecord::Base
  default_scope { order('title ASC') }
  belongs_to :decision
  belongs_to :creator, class: Participant
  has_many :assignments, dependent: :destroy
  has_many :fact_ratings, dependent: :destroy

  validates :title, presence: true
  validates :decision, presence: true
  validates :creator, presence: true
  validates :datatype, inclusion: { in: %w(NONE BOOLEAN VALUE) }

  after_create :create_assignments, :create_ratings

  def create_assignments
    decision.options(force_reload: true).each do |option|
      assignments.create(option: option)
    end
  end

  def create_ratings
    decision.participants.each do |participant|
      fact_ratings.create(participant: participant)
    end
  end

  # Refactor me!
  def rating(participant = nil)
    scores = { 1.0 => 0.25, 2.0 => 0.5, 3.0 => 1, 4.0 => 2, 5.0 => 4 }
    score = 0
    if participant.nil?
      fact_ratings.each do |f|
        score += scores[f.value] if f.value.present?
      end
      score / fact_ratings.count
    else
      scores[fact_ratings.find_by(participant: participant).value]
    end
  end

  def rating_relative(participant = nil)
    assignment_ratings = []
    assignments.map do |a|
      if participant.nil?
        assignment_ratings << a.assignment_ratings.map
      else
        assignment_ratings << a.assignment_ratings.where(participant_id: participant.id)
      end
    end
    assignment_ratings.empty? ? 0 : (rating(participant).to_f / (assignment_ratings.count)) * 100.0
  end
end
