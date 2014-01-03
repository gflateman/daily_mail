class DigestMailer < ActionMailer::Base
  default from: "digest@richardpic.com"

  def daily_digest(org_id)
    @org = Organization.find(org_id)
    @submissions = @org.submissions.where('created_at >= ?', 1.day.ago)
    mail(to: @org.recipient_emails.join(','), subject: "Casper Digest #{Time.now.strftime("%D")}")
  end
end
