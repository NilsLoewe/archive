# == Schema Information
#
# Table name: allocations
#
#  id         :integer          not null, primary key
#  option_id  :integer
#  fact_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  direction  :boolean
#  question   :boolean
#  relevant   :boolean
#  value      :string(255)
#

class Allocation < ActiveRecord::Base
  default_scope { order('created_at ASC') }
  belongs_to :option, class_name: "Option"
  belongs_to :fact, class_name: "Fact"
end
