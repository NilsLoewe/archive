# == Schema Information
#
# Table name: searches
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  type        :string(255)
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Knowledge < Search

end
