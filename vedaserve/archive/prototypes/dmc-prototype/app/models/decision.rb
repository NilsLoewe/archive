# == Schema Information
#
# Table name: decisions
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  description   :string(255)
#  email         :string(255)
#  author        :string(255)
#  closed        :boolean
#  chosen_option :integer
#  user_id       :integer
#  state         :string(255)
#  ratio         :integer
#  cloned        :boolean
#  clone_id      :integer
#  facts_enabled :boolean
#

class Decision < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title],
                  :using => {
                    :tsearch => {:prefix => true}
                  }

  belongs_to :user
  has_many :options
  has_many :facts
  has_many :participants

  has_many :clones
  has_many :decisions, through: :clones, source: :decision

end
