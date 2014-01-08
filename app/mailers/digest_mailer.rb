class DigestMailer < ActionMailer::Base
  default from: "no-reply@richardpic.com"

  def digest(org_id, since)
    @org = Organization.find(org_id)
    @submissions = @org.submissions.where('created_at >= ?', since)
    mail(from: "#{@org.address}@richardpic.com",
        to: @org.recipient_emails.join(','),
        subject: "#{@org.name} Digest #{Time.now.strftime("%D")}")
  end

  def reminder(org_id, emails_arr)
    @org = Organization.find(org_id)
    mail(from: "#{@org.address}@richardpic.com",
        to: emails_arr.join(','),
        subject: "Submission Reminder for #{@org.name}")
  end
end
