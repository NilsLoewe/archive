# == Schema Information
#
# Table name: questions
#
#  id                             :integer          not null, primary key
#  title                          :string(255)
#  enable                         :boolean
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  custom                         :boolean
#  topic_id                       :integer
#  research_web                   :boolean          default(FALSE), not null
#  research_database              :boolean          default(FALSE), not null
#  research_library               :boolean          default(FALSE), not null
#  research_interview             :boolean          default(FALSE), not null
#  short_answer                   :string(255)
#  answer                         :text
#  configured_research_categories :text
#  thoughts                       :text
#

class Question < ActiveRecord::Base
  attr_accessible :enable, :title, :custom, :topic_id, :short_answer, :answer, :thoughts
  belongs_to :topic
  belongs_to :user

  has_many :searches
  has_many :terms

  has_many :dataobjects, through: :searches

  validates :title,  presence: true, length: { maximum: 150 }
  validates :topic_id, presence: true

  default_scope -> { order('questions.created_at ASC') }
  scope :enabled, -> { where(enable: true) }

  def research_categories=(list)
    list = [] if list.nil?

    list.sort!

    write_attribute(:configured_research_categories, list.to_json)
  end

  def research_categories
    # TODO: this migration code can be removed once every question record has been loaded and saved
    if read_attribute(:configured_research_categories).nil?
      categories = []
      categories << 'web_search_result' if research_web
      categories << 'database_search_result' if research_database
      categories << 'library_search_result' if research_library
      categories << 'interview_result' if research_interview

      # migrate to the configured_research_categories field
      self.research_categories = categories
    else
      JSON.parse(read_attribute(:configured_research_categories))
    end
  end

  def category_enabled?(category_name)
    self.research_categories.include?(category_name)
  end
end
