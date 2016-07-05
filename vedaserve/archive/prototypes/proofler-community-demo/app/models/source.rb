class Source < ActiveRecord::Base
  self.inheritance_column = nil
  belongs_to :decision
  
  scope :link,      -> { where(type: "link") }
  scope :book,      -> { where(type: "book") }
  scope :article,   -> { where(type: "article") }
  scope :image,     -> { where(type: "image") }
  scope :contact,   -> { where(type: "contact") }
  scope :note,      -> { where(type: "note") }
end
