require 'rails_helper'

RSpec.describe Postman do
  let(:mail) { double('mail') }
  let(:decision) { build(:decision) }
  let(:participant) { decision.participants.build(attributes_for(:participant)) }

  it 'should send an email to the admin after a decision was created' do
    expect(mail).to receive(:deliver_now)
    expect(DecisionMailer).to receive(:new_decision_email).with(decision).and_return(mail)

    decision.subscribe(Postman.instance)

    decision.save
  end

  it 'should send an email to the new participant' do
    expect(mail).to receive(:deliver_now)
    expect(DecisionMailer).to receive(:new_participant_email).with(decision, participant).and_return(mail)

    participant.subscribe(Postman.instance)

    participant.save
  end
end
