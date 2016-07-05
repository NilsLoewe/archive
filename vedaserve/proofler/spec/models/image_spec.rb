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

require 'rails_helper'

RSpec.describe Image do
  subject do
    create(:image, option: create(:option))
  end

  it { should respond_to(:option) }

  it { should be_valid }
end
