# encoding: utf-8
# == Schema Information
#
# Table name: documents
#
#  id                   :integer          not null, primary key
#  title                :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  hashtag              :string(255)
#  document_template_id :integer
#

class Document < ActiveRecord::Base
  attr_accessible :title, :hashtag, :document_template_id

  has_many :document_parts, dependent: :destroy
  belongs_to :document_template

  validates :title, presence: true, length: { maximum: 32 }

  before_create :create_hashtag

  def to_param
    hashtag
  end

  def to_tex
    locals = calculate_locals_fake

    template = document_template.content
    erb = ERB.new(template)
    erb.result(binding)
  end

  private

  def calculate_locals_fake
    {
      :sender_name => 'Tobias Berg',
      :sender_address => 'Schaarsteinweg 12\\\92409 Schwandorf',
      :title =>  '',
      :recipient => 'Brigitte Ebersbacher\\\Schönhauser Allee 9\\\79856 Hinterzarten',
      :opening => 'Liebe Brigitte',
      :content => 'Mit VedaText kann ich schöne Briefe schreiben.',
      :closing => 'Alles Liebe,\\\Dein Tobi'
    }
  end

  def calculate_locals
    document_parts.inject({}) do |hash, part|
      hash[part.heading] = part.content
    end
  end

  def create_hashtag
    self.hashtag = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end
