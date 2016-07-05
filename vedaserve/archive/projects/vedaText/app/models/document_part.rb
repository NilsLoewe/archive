# == Schema Information
#
# Table name: document_parts
#
#  id          :integer          not null, primary key
#  content     :text
#  type        :string(255)
#  document_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class DocumentPart < ActiveRecord::Base
  attr_accessible :content, :id, :type
  belongs_to :document
  
  validates :document_id, presence: true
  
  default_scope order: 'document_parts.created_at ASC'
  
  def toTex
  end
end
