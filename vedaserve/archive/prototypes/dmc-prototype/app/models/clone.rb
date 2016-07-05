# == Schema Information
#
# Table name: clones
#
#  id          :integer          not null, primary key
#  decision_id :integer
#  clone_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Clone < ActiveRecord::Base
end
