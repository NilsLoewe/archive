require 'rails_helper'

RSpec.describe ApplicationMailer do
  let(:last_mail) { ActionMailer::Base.deliveries.last }

  let(:mail) do
    ApplicationMailer.mail(body: 'any body').deliver_now
    last_mail
  end

  let(:mail_with_bcc) do
    ApplicationMailer.mail(body: 'any body', bcc: ['custom-bcc@example.invalid']).deliver_now
    last_mail
  end

  it 'will BCC all emails to blind-carbon-copy@proofler.com' do
    expect(mail.bcc).to eql(['blind-carbon-copy@proofler.com'])
  end

  it 'will send mail from moin@proofler.com' do
    expect(mail.from).to eql(['moin@proofler.com'])
  end

  it 'will not override existing bcc options' do
    expect(mail_with_bcc.bcc).to eql(['custom-bcc@example.invalid'])
  end
end
