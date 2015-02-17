# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  plan_id      :integer
#  status       :string(255)
#  size         :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  done         :boolean
#  content      :text
#  week         :integer
#  current_week :boolean
#  plan_type    :string(255)
#  sprint       :boolean
#

class Task < ActiveRecord::Base
  attr_accessible :size, :status, :title, :plan_id, :plan_type, :done, :content, :week, :current_week, :sprint
  after_create :set_defaults
  belongs_to :plan, :polymorphic => true

  validates :title, presence: true, length: { maximum: 50 }
  validates :plan_id, presence: true

  scope :progress,   -> { where(sprint: true) }
  scope :no_progress,-> { where(sprint: false) }
  scope :planned,    -> { where(current_week: true) }
  scope :unplanned,  -> { where(current_week: false) }
  scope :backlog,    -> { where(sprint: false, done: false) }
  scope :archive,    -> { where(sprint: false, done: true) }

  scope :finished,   -> { where(done: true) }
  scope :unfinished, -> { where(done: false) }

  def archive!
    self.update_attribute(:sprint, false)
    self.update_attribute(:done, true)
  end

  def color
    self.plan.color
  end

  def week!
    self.update_attribute(:current_week, true)
  end

  def no_week!
    self.update_attribute(:week, 0)
    self.update_attribute(:current_week, false)
  end

  def week?
    self.current_week
  end

  def this_week!
    self.update_attribute(:week, Date.current.cweek)
  end

  def this_week?
    self.created_at > self.plan.week_start
  end

  private

    def set_defaults
      #self.update_attribute(:sprint, false)
      self.update_attribute(:done, false)
      self.update_attribute(:week, 0)
      self.update_attribute(:current_week, false)
    end
end
