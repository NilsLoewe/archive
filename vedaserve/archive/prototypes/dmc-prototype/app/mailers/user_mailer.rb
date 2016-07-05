class UserMailer < ActionMailer::Base
  default from: 'moin@proofler.com'

  def participate_email(participant)
    @participant = participant
    @user = User.find(@participant.user_id)
    @decision = Decision.find(@participant.decision_id)
    @url  = dashboard_participant_url(@participant)
    mail(to: @user.email, subject: 'Proofler: Nimm an einer Entscheidung teil!')
  end

  def rate_email(participant)
    @participant = participant
    @user = User.find(@participant.user_id)
    @decision = Decision.find(@participant.decision_id)
    @url  = dashboard_participant_url(@participant)
    mail(to: @user.email, subject: 'Proofler: Bewerte Optionen und Fakten!')
  end

end
