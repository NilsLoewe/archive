# == Schema Information
#
# Table name: decisions
#
#  id                       :integer          not null, primary key
#  title                    :string(255)
#  description              :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#  general_invitation_token :string
#  admin_id                 :integer
#  state                    :string
#  selected_id              :integer
#

class Decision < ActiveRecord::Base
  include Wisper.model

  has_many :participants
  has_many :options
  has_many :facts
  has_many :comments
  belongs_to :admin, class_name: "Participant"
  has_one :selected, class_name: "Option"

  before_validation :link_admin_decision, on: :create
  before_validation :generate_general_invitation_token, on: :create

  delegate :email, to: :admin, prefix: true
  delegate :invitation_token, to: :admin, prefix: true

  def assignments
    options.map(&:assignments).flatten
  end

  accepts_nested_attributes_for :admin

  validates :title, presence: true

  def closed?
    state == "closed"
  end

  def gather?
    state == "gather" || state.nil?
  end

  def rate?
    state == "rate"
  end

  protected

  def link_admin_decision
    return unless admin
    admin.decision = self
  end

  def generate_general_invitation_token
    self.general_invitation_token = SecureRandom.urlsafe_base64(16)
  end
end
