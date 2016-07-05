# == Schema Information
#
# Table name: assignments
#
#  id         :integer          not null, primary key
#  option_id  :integer
#  fact_id    :integer
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Assignment do
  let!(:decision) { create(:decision) }
  let!(:option) { create(:option, decision: decision, creator: decision.admin) }
  let!(:fact) { create(:fact, decision: decision, creator: decision.admin) }
  subject { decision.assignments.first }

  it { should respond_to(:value) }
  it { should respond_to(:option) }
  it { should respond_to(:fact) }
  it { should respond_to(:participants) }

  it 'must belong to a fact' do
    subject.fact = nil
    expect(subject).to be_invalid
  end

  it 'must belong to an option' do
    subject.option = nil
    expect(subject).to be_invalid
  end

  it 'is a unique pair of option and fact' do
    option = create(:option)
    fact = create(:fact)

    Assignment.create!(option: option, fact: fact)

    expect do
      Assignment.create!(option: option, fact: fact)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'creates assignment_rating entries' do
    decision_with_assignment_participant_count = 2

    expect { create(:option, decision: decision) }
      .to change { AssignmentRating.count }
      .by decision_with_assignment_participant_count
  end
end
