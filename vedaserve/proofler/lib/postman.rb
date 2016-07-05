class Postman
  include Singleton

  def create_decision_successful(decision)
    DecisionMailer.new_decision_email(decision).deliver_now
  end

  def create_participant_successful(participant)
    DecisionMailer.new_participant_email(participant.decision, participant).deliver_now
  end
end
