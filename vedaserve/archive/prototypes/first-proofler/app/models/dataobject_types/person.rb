# == Schema Information
#
# Table name: dataobjects
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  type       :string(255)
#  content    :string(255)
#  search_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  useful     :boolean
#  highlight  :boolean
#  reviewed   :boolean
#  note       :text
#  rating     :integer
#  score      :integer
#

class Person < Dataobject

end
