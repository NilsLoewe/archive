# == Schema Information
#
# Table name: clones
#
#  id          :integer          not null, primary key
#  decision_id :integer
#  clone_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Clone, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
