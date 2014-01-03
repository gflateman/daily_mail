class EmailProcessor
  def self.process(email)
    byebug
    org = Organization.find_by_address(email.to)
    # return unless org && org.member_emails.include?(email.from)
    org.submissions.create! body: email.body, email: email.from
  end
end
