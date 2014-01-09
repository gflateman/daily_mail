class DigestMailer < ActionMailer::Base
  default from: "no-reply@richardpic.com"

  def digest(org_id)
    @org = Organization.find(org_id)
    @submissions = @org.unsent_submissions
    mail(from: "#{@org.address}@richardpic.com",
        to: @org.recipient_emails.join(','),
        subject: "#{@org.name} Digest #{Time.now.strftime("%D")}")
  end

  def reminder(org_id)
    @org = Organization.find(org_id)
    mail(from: "#{@org.address}@richardpic.com",
        to: @org.unsubmitted_emails.join(','),
        subject: "Submission Reminder for #{@org.name}")
  end
end
