require 'rails_helper'

RSpec.describe DecisionMailer, type: :mailer do
  describe '.new_decision_email' do
    it 'should not blow up when rendering' do
      decision = create(:decision)
      mail = DecisionMailer.new_decision_email(decision)

      expect(mail.body.raw_source).to match(decision.title)
    end
  end

  describe '.new_participant_email' do
    it 'should not blow up when rendering' do
      decision = create(:decision)
      mail = DecisionMailer.new_participant_email(decision, decision.admin)

      expect(mail.body.raw_source).to match(decision.title)
    end
  end
end
