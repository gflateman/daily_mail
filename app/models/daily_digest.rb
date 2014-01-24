class DailyDigest < ActiveRecord::Base
  belongs_to :organization
  has_many :submissions

  scope :active, -> { where(state: 'active') }

  def submitted_emails
    self.submissions.pluck(:email).uniq
  end

  def unsubmitted_emails
    self.organization.member_emails - self.submitted_emails
  end

  def deliver
    DigestMailer.digest(self).deliver
    self.update_attributes(state: "delivered")
  end

  def send_reminder
    DigestMailer.reminder(self).deliver
  end

  def deliverable?(date = Date.current)
    !date.saturday? and !date.sunday?
  end

  def remindable?
    self.deliverable?(Date.current.tomorrow)
  end

end
