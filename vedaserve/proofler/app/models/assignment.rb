# == Schema Information
#
# Table name: assignments
#
#  id         :integer          not null, primary key
#  option_id  :integer
#  fact_id    :integer
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Assignment < ActiveRecord::Base
  default_scope { order('fact_id ASC') }
  belongs_to :option
  belongs_to :fact
  has_many :assignment_ratings, dependent: :destroy

  delegate :participants, to: :option
  delegate :decision, to: :option

  validates :fact, presence: true
  validates :option, presence: true
  validates_uniqueness_of :option_id, scope: :fact_id

  after_create :create_assignment_ratings

  def create_assignment_ratings
    participants.each do |participant|
      assignment_ratings.create(participant: participant)
    end
  end

  def parallel_values
    values = %w(JA NEIN)
    fact.assignments.each do |a|
      values.unshift a.value unless a.value.nil? || values.map(&:upcase).include?(a.value.upcase)
    end
    values
  end

  # Calculates the score from the assignment-ratings
  def assignment_rating(participant = nil)
    ratings = []
    if participant.nil?
      ratings << assignment_ratings.map
    else
      ratings << assignment_ratings.where(participant_id: participant.id)
    end
    ratings.empty? ? 1 : calculate_points(ratings)
  end

  def rating_relative(participant = nil)
    ratings = []
    if participant.nil?
      ratings << assignment_ratings.map
    else
      ratings << assignment_ratings.where(participant_id: participant.id)
    end
    ratings.empty? ? 0 : (assignment_rating(participant).to_f / ((ratings.count * 5.0) + 1)) * 100.0
  end

  private

  def calculate_points(assignment_ratings)
    points = 1
    assignment_ratings.map { |r| r.each { |a| points += (a.rating.present? ? a.rating : 1) } }
    points
  end
end
