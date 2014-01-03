class DigestMailer < ActionMailer::Base
  default from: "no-reply@richardpic.com"

  def digest(org_id, since)
    @org = Organization.find(org_id)
    @submissions = @org.submissions.where('created_at >= ?', since)
    mail(from: "#{@org.address}@richardpic.com",
        to: @org.recipient_emails.join(','),
        subject: "#{@org.name} Digest #{Time.now.strftime("%D")}")
  end
end
