# == Schema Information
#
# Table name: periodics
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  category_id :integer
#  user_id     :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Periodic < ActiveRecord::Base
  attr_accessible :category_id, :description, :title, :user_id
  
  default_scope order('created_at DESC')
  
  belongs_to :category  
  delegate :user, :to => :category, :allow_nil => true
  
  has_many :tasks, dependent: :destroy, :as => :plan

  validates :title, presence: true, length: { maximum: 50 }
  validates :category_id, presence: true    

  def color
    self.category.color
  end
    
  def planned_count
   self.tasks.count
  end
  
  def done_count
   self.tasks.finished.count
  end
  
  def week_start
    self.user.week_start
  end

end
