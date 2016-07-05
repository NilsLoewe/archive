# == Schema Information
#
# Table name: participants
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  email            :string(255)
#  status           :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  invitation_token :string(255)
#  decision_id      :integer
#

class Participant < ActiveRecord::Base
  include Wisper.model

  belongs_to :decision
  has_many :fact_ratings
  has_many :assignment_ratings
  has_many :feelings

  validates :name, presence: true
  validates :email, presence: true
  validates :decision, presence: true
  validates :invitation_token, presence: true

  delegate :options, to: :decision
  delegate :assignments, to: :decision

  after_create :create_fact_ratings, :create_feelings, :create_assignment_ratings

  before_validation :generate_invitation_token, on: :create

  def generate_invitation_token
    self.invitation_token = SecureRandom.urlsafe_base64(16)
  end

  def create_assignment_ratings
    assignments.each do |assignment|
      assignment.assignment_ratings.create(participant: self)
    end
  end

  def create_fact_ratings
    decision.facts.each do |fact|
      fact_ratings.create(fact: fact)
    end
  end

  def create_feelings
    options.each do |option|
      feelings.create(option: option)
    end
  end

  def admin?
    id == decision.admin.id
  end

  def next_fact
    fact_ratings.find { |x| x.value.nil? }
  end

  def rated_facts
    # There is a reported bug with the Performance/Count cop.
    # Disable the cop until the bug is fixed within rubocop
    # rubocop:disable Performance/Count
    fact_ratings.select { |x| x.value.present? }.count + 1
    # rubocop:enable Performance/Count
  end

  def next_feeling
    feelings.find { |x| x.value.nil? }
  end

  def rated_feelings
    # There is a reported bug with the Performance/Count cop.
    # Disable the cop until the bug is fixed within rubocop
    # rubocop:disable Performance/Count
    feelings.select { |x| x.value.present? }.count + 1
    # rubocop:enable Performance/Count
  end

  def rated?
    # There is a reported bug with the Performance/Count cop.
    # Disable the cop until the bug is fixed within rubocop
    # rubocop:disable Performance/Count
    feelings.select { |x| x.value.nil? }.count == 0
    # rubocop:enable Performance/Count
  end
end
