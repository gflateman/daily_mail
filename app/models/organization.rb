class Organization < ActiveRecord::Base
  has_many :submissions

  def unsubmitted_emails_since(since)
    # since = Chronic.parse('today at 7 AM')
    submitted_emails = self.submissions.where('created_at >= ?', since).pluck(:email).uniq
    unsubmitted_emails = self.member_emails - submitted_emails
  end

end
