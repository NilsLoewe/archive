# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  comment     :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  decision_id :integer
#  option_id   :integer
#  title       :string(255)
#

class Comment < ActiveRecord::Base
  belongs_to :option
  belongs_to :user
  default_scope { order('created_at DESC') }
end
