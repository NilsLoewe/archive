# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  email      :string(255)
#

class User < ActiveRecord::Base
  has_many :decisions, through: :participants
  has_many :questions
  has_many :guts
  has_many :fact_ratings
  has_many :points
  has_many :comments
end
