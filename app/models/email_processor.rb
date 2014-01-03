class EmailProcessor
  def self.process(email)
    # email.token grabs the recipient address before '@' sign
    org = Organization.first#.find_by_address(email.to.token.to_s)
    # return unless org && org.member_emails.include?(email.from)
    # org.submissions.create! body: email.body, email: email.from
    org.submissions.create! body: email.to.to_s, email: email.from
  end
end
