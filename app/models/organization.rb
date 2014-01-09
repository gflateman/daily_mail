class Organization < ActiveRecord::Base
  has_many :submissions

  def unsent_submissions
    self.submissions.where('created_at >= ?', self.last_digest_delivery).order(:email)
  end

  def submitted_emails
    self.unsent_submissions.pluck(:email).uniq
  end

  def unsubmitted_emails
    self.member_emails - self.submitted_emails
  end

  def should_deliver_digest?(date)
    # TODO: robustify
    date.saturday? or date.sunday?
  end

  def deliver_digest
    DigestMailer.digest(self.id).deliver
    self.update_attributes last_digest_delivery: Time.now
  end

  def deliver_reminder
    DigestMailer.reminder(self.id).deliver
  end

end
