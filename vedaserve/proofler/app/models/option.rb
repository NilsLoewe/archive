# == Schema Information
#
# Table name: options
#
#  id          :integer          not null, primary key
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  decision_id :integer
#  creator_id  :integer
#  link        :string
#  description :string
#
class Option < ActiveRecord::Base
  belongs_to :decision
  belongs_to :creator, class: Participant
  has_many :images
  has_many :comments, as: :commentable
  has_many :assignments, dependent: :destroy
  has_many :feelings, dependent: :destroy

  default_scope { order('created_at ASC') }

  validates :title, presence: true
  validates :decision, presence: true
  validates :creator, presence: true

  delegate :participants, to: :decision

  after_create :create_assignments, :create_feelings
  before_create :fill_open_graph

  def create_assignments
    decision.facts(force_reload: true).each do |fact|
      assignments.create(fact: fact)
    end
  end

  def create_feelings
    decision.participants.each do |participant|
      feelings.create(participant: participant)
    end
  end

  def fill_open_graph
    og = OpenGraph.new(link)
    self.description = og.description if og.description.present?
    fetch_og_image(og) if og.images.present?
  end

  # Calculate rating for the option: Includes fact rating, assignment rating and feeling
  def rating(participant = nil)
    fact_rating = 1
    assignments.each { |a| fact_rating += a.fact.rating(participant) }
    fact_rating * assignment_rating(participant) * feeling(participant)
  end

  # Calculates the feeling-score for the option
  def feeling(participant = nil)
    scores = { 1.0 => 0.75, 2.0 => 0.9, 3.0 => 1, 4.0 => 1.111, 5.0 => 1.334 }
    score = 0
    if participant.nil?
      feelings.each { |f| score += (f.value.present? ? scores[f.value] : 1) }
      score / feelings.count
    else
      scores[feelings.find_by(participant: participant).value]
    end
  end

  # Calculates the percentage of the feeling value relative to all options
  def feeling_relative(participant = nil)
    score = 0
    max = 5.0
    if participant.nil?
      feelings.each { |f| score += (f.value.present? ? f.value : 1) }
      max *= feelings.count
    else
      score = feelings.find_by(participant: participant).value
    end
    (score / max) * 100
  end

  # Calculates the score from the assignment-ratings
  def assignment_rating(participant = nil)
    assignment_ratings = []
    assignments.map do |a|
      if participant.nil?
        assignment_ratings << a.assignment_ratings.map
      else
        assignment_ratings << a.assignment_ratings.where(participant_id: participant.id)
      end
    end
    assignment_ratings.empty? ? 1 : calculate_points(assignment_ratings)
  end

  # Calculates the percentage of the assignment rating value relative to all options
  def assignment_rating_relative(participant = nil)
    assignment_ratings = []
    assignments.map do |a|
      if participant.nil?
        assignment_ratings << a.assignment_ratings.map
      else
        assignment_ratings << a.assignment_ratings.where(participant_id: participant.id)
      end
    end
    assignment_ratings.empty? ? 0 : (assignment_rating(participant).to_f / ((assignment_ratings.count * 5.0) + 1)) * 100.0
  end

  private

  def calculate_points(assignment_ratings)
    points = 1
    assignment_ratings.map { |r| r.each { |a| points += (a.rating.present? ? a.rating : 1) } }
    points
  end

  def sanitize_link
    self.link = "http://#{link}" unless link =~ %r{/^https?:\/\//} if link_changed?
    self.link = "" if link == "http://"
  end

  def fetch_og_image(og)
    image = Image.create
    image.file_from_url URI.parse(URI.encode(og.images[0]))
    print(image.inspect)
    images << image unless image.file_file_name.nil?
  end
end
