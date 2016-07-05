# == Schema Information
#
# Table name: images
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  option_id         :integer
#

class Image < ActiveRecord::Base
  belongs_to :option

  default_scope {order('created_at ASC')}

  has_attached_file :file,
    :storage => :ftp,
    :path => "/:attachment/:id/:style/:filename",
    :url => "http://images.proofler.com/:attachment/:id/:style/:filename",
    :ftp_servers => [
      {
        :host     => "images.proofler.com",
        :user     => "ftp11160188-proofler",
        :password => "proofler",
        :passive  => true
      }
    ],
    :styles => {
      :thumb    => ['100x100#',  :jpg, :quality => 70],
      :preview  => ['480x480#',  :jpg, :quality => 70],
      :large    => ['600>',      :jpg, :quality => 70],
      :retina   => ['1200>',     :jpg, :quality => 30]
    },
    :convert_options => {
      :thumb    => '-set colorspace sRGB -strip',
      :preview  => '-set colorspace sRGB -strip',
      :large    => '-set colorspace sRGB -strip',
      :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
    }

  validates_attachment :file,
      :size => { :in => 0..2.megabytes },
      :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
end
