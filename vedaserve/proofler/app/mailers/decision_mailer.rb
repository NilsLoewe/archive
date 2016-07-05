class DecisionMailer < ApplicationMailer
  def new_decision_email(decision)
    @decision = decision
    @participant = decision.admin

    mail(to: @decision.admin.email, subject: I18n.t('mails.decisions.new.subject', title: decision.title))
  end

  def self.send_rate_decision_emails(decision)
    @decision = decision
    @decision.participants.each do |participant|
      rate_decision_email(@decision, participant).deliver
    end
  end

  def rate_decision_email(decision, p)
    @participant = p
    @decision = decision
    @admin = decision.admin
    mail(to: p.email, subject: I18n.t('mails.decisions.rate.subject', title: decision.title)) unless p.admin?
  end

  def self.send_final_decision_emails(decision)
    @decision = decision
    @decision.participants.each do |participant|
      close_decision_email(@decision, participant).deliver
    end
  end

  def close_decision_email(decision, p)
    @participant = p
    @decision = decision
    mail(to: p.email, subject: I18n.t('mails.decisions.close.subject', title: decision.title)) unless p.admin?
  end

  def new_participant_email(decision, participant)
    @decision = decision
    @participant = participant
    @admin = decision.admin

    mail(to: participant.email, subject: I18n.t('mails.participants.new.subject', title: decision.title))
  end
end
