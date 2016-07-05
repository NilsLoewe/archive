# == Schema Information
#
# Table name: questions
#
#  id           :integer          not null, primary key
#  question1_id :integer
#  question2    :integer
#  created_at   :datetime
#  updated_at   :datetime
#  fact1        :integer
#  fact2        :integer
#  answered     :boolean
#  chosen       :integer
#  user_id      :integer
#  fact1_id     :integer
#  fact2_id     :integer
#  done         :boolean
#

class Question < ActiveRecord::Base
  default_scope { order('created_at ASC') }
  belongs_to :fact1, class_name: "Fact"
  belongs_to :fact2, class_name: "Fact"
end
