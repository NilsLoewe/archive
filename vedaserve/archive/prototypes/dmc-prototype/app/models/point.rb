# == Schema Information
#
# Table name: points
#
#  id             :integer          not null, primary key
#  fact_id        :integer
#  participant_id :integer
#  value          :integer
#  created_at     :datetime
#  updated_at     :datetime
#  user_id        :integer
#

class Point < ActiveRecord::Base
  default_scope { order('created_at ASC') }
  belongs_to :user
  belongs_to :fact
end
