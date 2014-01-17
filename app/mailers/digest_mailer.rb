class DigestMailer < ActionMailer::Base
  default from: "no-reply@richardpic.com"

  def digest(digest)
    @digest = digest
    @org = @digest.organization
    @submissions = @digest.submissions
    mail(from: "#{@org.address}@richardpic.com",
        to: @org.recipient_emails.join(','),
        subject: "#{@org.name} Digest #{Time.now.strftime("%D")}")
  end

  def reminder(digest)
    @digest = digest
    @org = @digest.organization
    mail(from: "#{@org.address}@richardpic.com",
        to: @digest.unsubmitted_emails.join(','),
        subject: "Submission Reminder for #{@org.name}")
  end
end
