class Organization < ActiveRecord::Base
  has_many :submissions

  def unsent_submissions
    self.submissions.where('created_at >= ?', self.last_digest_delivery).order(:email)
  end

  def unsubmitted_emails
    submitted_emails = self.unsent_submissions.pluck(:email).uniq
    unsubmitted_emails = self.member_emails - submitted_emails
  end

  def send_digest
    DigestMailer.digest(self.id).deliver
    self.update_attributes last_digest_delivery: Time.now
  end

  def send_reminder
    DigestMailer.reminder(self.id, self.unsubmitted_emails).deliver
  end

end
