class EmailProcessor
  def self.process(email)
    # email.to grabs an array of the recipient address before '@' sign, ie. ['digest']
    org = Organization.find_by_address(email.to.first.to_s)
    return unless org && org.member_emails.include?(email.from)
    org.submissions.create! body: email.body, email: email.from
  end
end
