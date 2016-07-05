# == Schema Information
#
# Table name: participants
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  email            :string(255)
#  status           :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  invitation_token :string(255)
#  decision_id      :integer
#

require 'rails_helper'

RSpec.describe Participant do
  subject do
    create(:participant, decision: create(:decision))
  end

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:invitation_token) }

  it { should respond_to(:decision) }

  it { should respond_to(:fact_ratings) }
  it { should respond_to(:assignment_ratings) }
  it { should respond_to(:feelings) }

  it { should be_valid }

  it "is must have a name" do
    subject.name = nil
    expect(subject).to be_invalid
  end

  it "is must have an email" do
    subject.email = nil
    expect(subject).to be_invalid
  end

  it 'it must have a invitation_token' do
    subject.invitation_token = nil
    expect(subject).to be_invalid
  end

  it 'should create fact_ratings for all existing facts' do
    decision = create(:decision)
    decision.facts.create(title: "Fact", creator: decision.admin)

    participant = Participant.new(name: 'my name', email: 'hello@foo.bar', decision: decision)
    expect { participant.save! }.to change { FactRating.count }.by(1)
  end

  it 'should create assignment_ratings for all existing assignments' do
    decision = create(:decision, :with_facts, facts_count: 1, options_count: 1)

    expect { create(:participant, decision: decision) }
      .to change { AssignmentRating.count }
      .by(1)
  end

  it 'should create feelings for all existing options' do
    decision = create(:decision)
    decision.options.create(title: "Option", creator: decision.admin)

    participant = Participant.new(name: 'my name', email: 'hello@foo.bar', decision: decision)
    expect { participant.save! }.to change { Feeling.count }.by(1)
  end

  it 'should generate a random invitation token for participants' do
    participant = build(:participant, decision: create(:decision))

    participant.save!

    expect(participant.invitation_token).to be_present
  end

  it 'should not override existing invitation_token' do
    participant = create(:participant, decision: create(:decision))
    existing_token = participant.invitation_token

    participant.save!

    expect(participant.reload.invitation_token).to eql(existing_token)
  end
end
