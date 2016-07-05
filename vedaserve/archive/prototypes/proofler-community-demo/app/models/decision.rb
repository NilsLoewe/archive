# == Schema Information
#
# Table name: decisions
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  constrains  :string(255)
#  title       :string(255)
#

class Decision < ActiveRecord::Base
  belongs_to :user
  belongs_to :document
  has_many :sources
  has_many :questions
  has_many :constraints
end
