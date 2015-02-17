# == Schema Information
#
# Table name: visions
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Vision < ActiveRecord::Base
end
