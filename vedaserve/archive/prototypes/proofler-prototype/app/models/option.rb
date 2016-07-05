# == Schema Information
#
# Table name: options
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  decision_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  rated       :boolean
#  selected    :boolean
#  description :string(255)
#

class Option < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title, :description],
                  :using => {
                    :tsearch => {:prefix => true}
                  }

  default_scope { order('created_at ASC') }

  has_many :allocations
  has_many :option_assets
  has_many :facts, through: :allocations, source: :fact
  has_many :guts, class_name: "Guts"
  has_many :images
  has_many :comments
  belongs_to :decision

  def guts_points
    if self.guts.count > 0
      self.guts.sum(:value) * 100
    else
      0
    end
  end

  def brain_points
    if self.allocations.count > 0

      mind_cnt = self.allocations.count
      fact_sum = 0

      self.allocations.each do |a|
        a.fact.fact_ratings.each do |r|
          if a.direction?
            fact_sum += r.value  
          else
            fact_sum -= r.value
          end
        end
      end
      fact_sum * 100
    else
      0
    end
  end

  def guts_value
    if self.guts.count > 0
      max = self.guts.count * 2 * 100
      guts_points * 100 / max
    else
      0
    end
  end

  def brain_value
    if self.allocations.count > 0
      max = self.allocations.count * 2 * 100 * self.decision.participants.count
      brain_points * 100 / max
    else
      0
    end
  end

  def points
    if self.allocations.count > 0
      p = ((guts_value + brain_value) ) / 2
    else
      p = guts_value
    end
    (p + 100) / 2
  end

  def value
    23
  end
end
