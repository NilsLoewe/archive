# == Schema Information
#
# Table name: assignment_ratings
#
#  id             :integer          not null, primary key
#  assignment_id  :integer
#  participant_id :integer
#  rating         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# How much does an Assignment (Fact value of an Option) fulfill the fact
class AssignmentRating < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :participant
end
