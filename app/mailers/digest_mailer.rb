class DigestMailer < ActionMailer::Base
  default from: "digest@richardpic.com"

  def daily_digest(org_id)
    @org = Organization.find(org_id)
    @submissions = @org.submissions.where('created_at >= ?', 1.day.ago)
    mail(to: Proc.new { @org.recipient_emails }, subject: "Casper Digest #{Time.now.strftime("%D")}")
  end
end
