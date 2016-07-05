# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  comment          :string
#  option_id        :integer
#  participant_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :integer
#  commentable_type :string
#  decision_id      :integer
#

require 'rails_helper'

RSpec.describe Comment do
  subject do
    create(:comment)
  end

  it { should respond_to(:comment) }
  it { should respond_to(:participant) }

  it { should be_valid }

  it "is must have a comment" do
    subject.comment = nil
    expect(subject).to be_invalid
  end
end
