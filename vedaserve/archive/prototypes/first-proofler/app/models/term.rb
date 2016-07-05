# == Schema Information
#
# Table name: terms
#
#  id          :integer          not null, primary key
#  term        :string(255)
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Term < ActiveRecord::Base
  attr_accessible :term
  belongs_to :question

  validates :term,  presence: true, length: { maximum: 50 }
  validates :question_id, presence: true

  # SemRush
  def buildSemrushQuery

    return Rails.configuration.semrush["host"] +
           "?action=report" +
           "&type=phrase_related" +
           "&phrase=" + term +
           "&key=" + Rails.configuration.semrush["apikey"] +
           "&display_limit=5" +
           "&export=api"+
           "&export_columns=Ph,Nq,Nr,Td"

  end

  def getSemrushData

    result = (Curl::Easy.perform(buildSemrushQuery))

    if result.response_code == 200
      result = result.body_str
    else
      result = "Keyword;Search Volume;Number of Results;Trends
      No data found;0;0;0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0"
    end

    return result.force_encoding("UTF-8")
  end

  def getStats
    query = getSemrushData
    query = query.split(/\r?\n/) # Get the lines out of it
    query.shift # Drop the description line
    query = query.collect{|x| x.split(';')}
    query.collect{|x| x[3] = x[3].split(',')}

    keys = ['keyword', 'queries', 'results', 'stats']
    result = []
    query.each {|q| result << Hash[keys.zip(q)] }

    return result
  end

  # Openthesaurus
  def buildThesaurusQuery
    return "http://www.openthesaurus.de/synonyme/search?q=" + term + "&format=application/json&similar=true"
  end

  def getThesaurusData
    json = (Curl::Easy.perform(buildThesaurusQuery)).body_str
    return json && json.length >= 2 ? JSON.parse(json) : nil
  end

  def getSynonyms
    json = getThesaurusData
    ret = {}

    if json

      syn = json["synsets"]
      synonyms = {}

      syn.each do |s|
        terms = s["terms"]

        terms.each do |t|
          synonyms[t["level"]] ||= []
          synonyms[t["level"]] << t["term"].sub(/\s*\((.*)\)\s*/, '')
        end
      end

      synonyms[nil]
    end
  end

end
