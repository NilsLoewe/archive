# == Schema Information
#
# Table name: feelings
#
#  id             :integer          not null, primary key
#  value          :float
#  option_id      :integer
#  participant_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  favourite      :boolean
#

require 'rails_helper'

RSpec.describe Feeling do
  subject do
    create(:feeling)
  end

  it { should respond_to(:value) }
  it { should respond_to(:option) }
  it { should respond_to(:participant) }

  it 'must belong to a participant' do
    subject.participant = nil
    expect(subject).to be_invalid
  end

  it 'must belong to an option' do
    subject.option = nil
    expect(subject).to be_invalid
  end

  it 'is a unique pair of option and participant' do
    option = create(:option)
    decision = create(:decision)
    participant = create(:participant, decision: decision)

    Feeling.create!(option: option, participant: participant)

    expect do
      Feeling.create!(option: option, participant: participant)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
end
