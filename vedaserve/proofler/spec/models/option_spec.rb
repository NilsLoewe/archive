# == Schema Information
#
# Table name: options
#
#  id          :integer          not null, primary key
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  decision_id :integer
#  creator_id  :integer
#  link        :string
#  description :string
#

require 'rails_helper'

RSpec.describe Option, type: :model do
  subject { create(:option) }

  it { should respond_to(:title) }
  it { should respond_to(:decision) }
  it { should respond_to(:creator) }
  it { should respond_to(:images) }
  it { should respond_to(:comments) }
  it { should respond_to(:assignments) }
  it { should respond_to(:feelings) }
  it { should respond_to(:participants) }

  it 'must have a title' do
    subject.title = nil
    expect(subject).to be_invalid
  end

  it 'must belong to a decision' do
    subject.decision = nil
    expect(subject).to be_invalid
  end

  it 'must have a creator' do
    subject.creator = nil
    expect(subject).to be_invalid
  end

  it 'should create assignments for all existing facts' do
    decision = create(:decision, :with_facts, facts_count: 1)

    option = Option.new(title: 'an option', decision: decision, creator: decision.admin)
    expect { option.save! }.to change { Assignment.count }.by(1)
  end

  it 'should create feelings for all existing participants' do
    decision = create(:decision)
    participant = create(:participant, decision: decision)

    option = Option.new(title: 'an option', decision: decision, creator: decision.admin)
    expect { option.save! }.to change { Feeling.count }.by(2)

    expect(option.reload.feelings.last.participant).to eq(participant)
  end

  it 'creates assignment_rating entries' do
    decision = create(:decision)
    participant = create(:participant, decision: decision)

    fact = Fact.new(title: 'a fact', decision: decision, creator: decision.admin, datatype: 'BOOLEAN')
    expect { fact.save! }.to change { AssignmentRating.count }.by(0)

    decision.facts.reload
    option = Option.new(title: 'an option', decision: decision, creator: decision.admin)
    expect { option.save! }.to change { AssignmentRating.count }.by(2)

    option.assignments.reload
    option.assignments.first.assignment_ratings.reload

    option.assignments.first.assignment_ratings.first.rating = 4
    option.assignments.first.assignment_ratings.second.rating = 2
    option.assignments.first.assignment_ratings.each(&:save!)

    expect(option.assignment_rating).to eq(7)
    expect(option.assignment_rating(decision.admin)).to eq(5)
    expect(option.assignment_rating(participant)).to eq(3)
  end

  it 'should return feelings for two participants' do
    decision = create(:decision)
    participant = create(:participant, decision: decision)

    option = Option.new(title: 'an option', decision: decision, creator: decision.admin)
    expect { option.save! }.to change { Feeling.count }.by(2)

    option.feelings.reload
    option.feelings.first.value = 5
    option.feelings.last.value = 1
    option.feelings.each(&:save!)

    expect(option.feeling).to eq(1.042)
    expect(option.feeling(decision.admin)).to eq(1.334)
    expect(option.feeling(participant)).to eq(0.75)
  end

  # Refactor me!
  it 'should return ratings for two participants' do
    decision = create(:decision)
    create(:participant, decision: decision)

    fact = Fact.new(title: 'a fact', decision: decision, creator: decision.admin, datatype: 'BOOLEAN')
    expect { fact.save! }.to change { AssignmentRating.count }.by(0)

    decision.facts.reload
    option1 = Option.new(title: 'an option', decision: decision, creator: decision.admin)
    expect { option1.save! }.to change { AssignmentRating.count }.by(2)

    option2 = Option.new(title: 'a second option', decision: decision, creator: decision.admin)
    expect { option2.save! }.to change { AssignmentRating.count }.by(2)

    fact.assignments.reload
    fact.fact_ratings.reload
    fact.fact_ratings.first.value = 5
    fact.fact_ratings.last.value = 1
    fact.fact_ratings.each(&:save!)

    option1.feelings.reload
    option1.feelings.first.value = 3
    option1.feelings.last.value = 3
    option1.feelings.each(&:save!)

    option1.assignments.reload
    option1.assignments.first.assignment_ratings.reload
    option1.assignments.first.assignment_ratings.first.rating = 3
    option1.assignments.first.assignment_ratings.second.rating = 1
    option1.assignments.first.assignment_ratings.each(&:save!)

    option2.feelings.reload
    option2.feelings.first.value = 3
    option2.feelings.last.value = 3
    option2.feelings.each(&:save!)

    option2.assignments.reload
    option2.assignments.first.assignment_ratings.reload
    option2.assignments.first.assignment_ratings.first.rating = 5
    option2.assignments.first.assignment_ratings.second.rating = 3
    option2.assignments.first.assignment_ratings.each(&:save!)

    expect(Option.first.rating).to eq(15.625)
    expect(Option.second.rating).to eq(28.125)

    expect(Option.first).to eq(option1)
    expect(Option.second).to eq(option2)

    options = Option.all.sort_by(&:rating).reverse
    expect(options.first).to eq(option2)
    expect(options.second).to eq(option1)
  end
end
