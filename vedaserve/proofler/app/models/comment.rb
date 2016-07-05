# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  comment          :string
#  option_id        :integer
#  participant_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :integer
#  commentable_type :string
#  decision_id      :integer
#

class Comment < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  belongs_to :commentable, polymorphic: true
  belongs_to :decision

  belongs_to :participant

  validates :comment, presence: true
end
