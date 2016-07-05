# == Schema Information
#
# Table name: fact_ratings
#
#  id             :integer          not null, primary key
#  value          :float
#  fact_id        :integer
#  participant_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe FactRating do
  subject do
    create(:fact_rating)
  end

  it { should respond_to(:value) }
  it { should respond_to(:fact) }
  it { should respond_to(:participant) }

  it 'must belong to a participant' do
    subject.participant = nil
    expect(subject).to be_invalid
  end

  it 'must belong to an fact' do
    subject.fact = nil
    expect(subject).to be_invalid
  end

  it 'is a unique pair of fact and participant' do
    fact = create(:fact)
    decision = create(:decision)
    participant = create(:participant, decision: decision)

    FactRating.create!(fact: fact, participant: participant)

    expect do
      FactRating.create!(fact: fact, participant: participant)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
end
