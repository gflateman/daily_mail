require 'spec_helper'

describe DigestMailer do
  describe '#digest' do
    let(:org) { FactoryGirl.create(:org_with_digest_and_submission) }
    before { DigestMailer.digest(org.daily_digests.first) }
    subject(:mail) { ActionMailer::Base.deliveries }

    it 'renders the subject' do
      # puts mail
      expect(mail.subject).to eq("Casper Digest #{Time.now.strftime("%D")}")
    end

    xit 'renders the receiver email' do
      expect(mail.to).to eq(org.recipient_emails)
    end

    xit 'renders the sender email' do
      expect(mail.from).to eq(["#{org.address}@richardpic.com"])
    end

    xit 'assigns @submissions' do
      expect(mail.body.encoded).to match(@submission.body)
    end
  end
end
