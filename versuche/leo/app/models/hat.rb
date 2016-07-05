# == Schema Information
#
# Table name: hats
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#  priority    :integer
#

class Hat < ActiveRecord::Base

  belongs_to :user

  acts_as_list scope: :user, column: :priority, add_new_at: :top

  validates :user_id, presence: true
  validates :title, presence: true
end
