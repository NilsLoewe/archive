class ApplicationMailer < ActionMailer::Base
  default from: 'moin@proofler.com'
  layout 'mailer'

  protected

  def mail_with_bcc(headers = {}, &block)
    headers.merge!(bcc: 'blind-carbon-copy@proofler.com') unless headers[:bcc]
    mail_without_bcc(headers, &block)
  end

  alias_method_chain :mail, :bcc
end
