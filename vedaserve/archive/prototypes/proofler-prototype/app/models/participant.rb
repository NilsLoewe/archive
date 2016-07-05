# == Schema Information
#
# Table name: participants
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  email       :string(255)
#  decision_id :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  invited     :boolean
#  admin       :boolean
#

class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :decision
end
