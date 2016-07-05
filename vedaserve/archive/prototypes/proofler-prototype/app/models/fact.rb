# == Schema Information
#
# Table name: facts
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  decision_id :integer
#  neg         :boolean
#  description :string(255)
#  type        :string(255)
#

class Fact < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title, :description],
                  :using => {
                    :tsearch => {:prefix => true}
                  }
  Fact.inheritance_column = nil

  default_scope { order('created_at ASC') }
  belongs_to :decision
  has_many :allocations
  has_many :options, through: :allocations, source: :option
  has_many :fact_assets
  has_many :fact_ratings

  def points
    42
  end

  def value
    23
  end
    
end
