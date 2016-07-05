# == Schema Information
#
# Table name: feelings
#
#  id             :integer          not null, primary key
#  value          :float
#  option_id      :integer
#  participant_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  favourite      :boolean
#

class Feeling < ActiveRecord::Base
  belongs_to :option
  belongs_to :participant

  validates :participant, presence: true
  validates :option, presence: true
  validates_uniqueness_of :option_id, scope: :participant_id
end
