# == Schema Information
#
# Table name: fact_ratings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  fact_id    :integer
#  value      :integer
#  created_at :datetime
#  updated_at :datetime
#  unset      :boolean          default(TRUE)
#

class FactRating < ActiveRecord::Base
  default_scope { order('created_at ASC') }
  scope :notset, lambda { where(:unset => true) }

  belongs_to :user
  belongs_to :fact
end
