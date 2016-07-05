# == Schema Information
#
# Table name: guts
#
#  id         :integer          not null, primary key
#  option_id  :integer
#  user_id    :integer
#  value      :integer
#  created_at :datetime
#  updated_at :datetime
#  unset      :boolean          default(TRUE)
#

class Gut < ActiveRecord::Base
  default_scope { order('created_at ASC') }
  scope :notset, lambda { where(:unset => true) }
  belongs_to :user
  belongs_to :option
end