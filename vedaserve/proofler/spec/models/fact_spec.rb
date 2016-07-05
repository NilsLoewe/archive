# == Schema Information
#
# Table name: facts
#
#  id          :integer          not null, primary key
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  decision_id :integer
#  creator_id  :integer
#  datatype    :string
#

require 'rails_helper'

RSpec.describe Fact do
  subject do
    create(:fact, decision: create(:decision))
  end

  it { should respond_to(:title) }
  it { should respond_to(:decision) }
  it { should respond_to(:creator) }
  it { should respond_to(:datatype) }
  it { should respond_to(:assignments) }
  it { should respond_to(:fact_ratings) }

  it { should respond_to(:rating) }

  it { should be_valid }

  it "is must have a title" do
    subject.title = nil
    expect(subject).to be_invalid
  end

  it 'must have a creator' do
    subject.creator = nil
    expect(subject).to be_invalid
  end

  it 'must reject unknown data types' do
    subject.datatype = 'not-a-known-datatype'
    expect(subject).to be_invalid
  end

  it 'accepts valid data types' do
    subject.datatype = 'BOOLEAN'
    expect(subject).to be_valid
  end

  it 'should create assignments for all existing option' do
    decision = create(:decision)
    decision.options.create(title: "Option", creator: decision.admin)

    fact = Fact.new(title: 'an fact', decision: decision, creator: decision.admin, datatype: 'BOOLEAN')
    expect { fact.save! }.to change { Assignment.count }.by(1)
  end

  it 'should create ratings for all existing participants' do
    decision = create(:decision)
    participant = create(:participant, decision: decision)

    fact = Fact.new(title: 'a fact', decision: decision, creator: decision.admin, datatype: 'BOOLEAN')
    expect { fact.save! }.to change { FactRating.count }.by(2)

    expect(fact.reload.fact_ratings.last.participant).to eq(participant)
  end

  it 'should return a rating_value for two participants' do
    decision = create(:decision)
    participant = create(:participant, decision: decision)

    fact = Fact.new(title: 'a fact', decision: decision, creator: decision.admin, datatype: 'BOOLEAN')
    expect { fact.save! }.to change { FactRating.count }.by(2)

    fact.assignments.reload
    fact.fact_ratings.reload

    fact.fact_ratings.first.value = 5
    fact.fact_ratings.last.value = 1
    fact.fact_ratings.each(&:save!)

    expect(fact.rating).to eq(2.125)
    expect(fact.rating(decision.admin)).to eq(4)
    expect(fact.rating(participant)).to eq(0.25)
  end
end
