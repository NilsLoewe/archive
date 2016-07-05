# == Schema Information
#
# Table name: researches
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Research < ActiveRecord::Base
  attr_accessible :description, :title
  belongs_to :user
  has_many :topics, dependent: :destroy
  has_many :questions, through: :topics

  validates :title,  presence: true, length: { maximum: 50 }
  validates :user_id, presence: true

  def populate
    # Erste Kategorie
    self.topics.create(:title => 'Markt')
    self.topics.last.questions.create(:title => 'Wieso', :custom => false, :enable => false)
    self.topics.last.questions.create(:title => 'Weshalb', :custom => false, :enable => false)
    self.topics.last.questions.create(:title => 'Warum', :custom => false, :enable => false)
    # Zweite Kategorie
    self.topics.create(:title => 'Kunden')
    self.topics.last.questions.create(:title => 'Anzahl', :custom => false, :enable => false)
    self.topics.last.questions.create(:title => 'Motivation', :custom => false, :enable => false)
    self.topics.last.questions.create(:title => 'Und so weiter', :custom => false, :enable => false)
    # Eigene Fragen
    self.topics.create(:title => 'Eigene Fragen')
  end
end
