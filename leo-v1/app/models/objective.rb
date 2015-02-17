# == Schema Information
#
# Table name: objectives
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :text
#  category_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  status       :string(255)
#  sprint_end   :date
#  sprint_start :date
#  duration     :integer
#  sprinttitle  :string(255)
#  archive      :boolean
#  parked       :boolean
#  simple       :boolean
#

class Objective < ActiveRecord::Base
  attr_accessible :description, :title, :category_id, :status, :duration, :sprint_start, :sprinttitle, :simple, :archive, :parked

  default_scope order('sprint_end ASC')
  scope :active,    -> { where(archive: false, parked: false) }
  scope :done,      -> { where(archive: true) }
  scope :parked,      -> { where(parked: true) }

  after_create :set_defaults

  belongs_to :category
  delegate :user, :to => :category, :allow_nil => true

  has_many :tasks, dependent: :destroy, :as => :plan

  validates :title, presence: true, length: { maximum: 50 }
  validates :category_id, presence: true

  STATES = %w{ planning sprint_running sprint_finished }

  STATES.each do |status|
    define_method("#{status}?") do
      self.status == status
    end

    define_method("#{status}!") do
      self.update_attribute(:status, status)
    end
  end

  def unfinished_tasks_in_current_sprint?
    self.tasks.progress.unfinished.count > 0
  end

  def finish_sprint!
    self.tasks.progress.each do |t|
      t.archive!
    end
    self.planning!
  end

  def days_left
    ((self.sprint_start + self.duration) - Date.today).to_i
  end

  def update_sprint_end
    self.update_attribute(:sprint_end, (self.sprint_start + self.duration))
  end

  def unfinished_tasks
    self.tasks.unfinished.count
  end

  def unfinished_tasks_size
    self.tasks.unfinished.sum(:size)
  end

  def week_start
    self.user.week_start
  end

  def color
    self.category.color
  end

  private

  def set_defaults
    self.status = "planning"
    self.sprint_end = Date.today
    self.update_attribute(:simple, true)
    self.update_attribute(:parked, false)
    self.update_attribute(:archive, false)
    #self.update_attribute(:sprint_end, (self.sprint_start + 9999))
  end

end
