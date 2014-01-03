class DigestMailer < ActionMailer::Base
  default from: "digest@richardpic.com"

  def daily_digest
    @submissions = Submission.where('created_at >= ?', 1.day.ago)
    mail to: 'gabe@caspersleep.com', subject: "Casper Digest #{Time.now.strftime("%D")}"
  end
end
