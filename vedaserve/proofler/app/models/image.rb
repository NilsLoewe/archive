# == Schema Information
#
# Table name: images
#
#  id                :integer          not null, primary key
#  title             :string
#  option_id         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#
require "open-uri"

class Image < ActiveRecord::Base
  belongs_to :option
  # validates :title, presence: true

  has_attached_file :file,
                    storage: "ftp",
                    path: "/:attachment/:id/:style/:filename",
                    url: "http://" + Rails.configuration.paperclip_ftp[:hostname] + "/:attachment/:id/:style/:filename",
                    ftp_servers: [
                      {
                        host:     Rails.configuration.paperclip_ftp[:hostname],
                        user:     Rails.configuration.paperclip_ftp[:username],
                        password: Rails.configuration.paperclip_ftp[:password],
                        passive:  true
                      }
                    ],
                    styles: {
                      thumb:    ['100x100#',  :jpg, quality: 70],
                      preview:  ['480x480#',  :jpg, quality: 70],
                      large:    ['600>',      :jpg, quality: 70],
                      retina:   ['1200>',     :jpg, quality: 30]
                    },
                    convert_options: {
                      thumb:    '-set colorspace sRGB -strip',
                      preview:  '-set colorspace sRGB -strip',
                      large:    '-set colorspace sRGB -strip',
                      retina:   '-set colorspace sRGB -strip -sharpen 0x0.5'
                    }

  validates_attachment :file,
                       size: { in: 0..2.megabytes },
                       content_type: { content_type: %r{^image/(jpeg|png|gif|tiff)$} }

  def file_from_url(url)
    self.file = open(url) if url
  rescue
    logger.debug "Invalid link: #{url}"
  end
end
