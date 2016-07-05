# == Schema Information
#
# Table name: document_templates
#
#  id       :integer          not null, primary key
#  name     :string(255)
#  filename :string(255)
#  type     :integer
#

class DocumentTemplate < ActiveRecord::Base
  attr_accessible :name, :filename
  has_many :documents

  def content
    File.read("#{Rails.root}/app/views/latex/#{filename}")
  end
end
