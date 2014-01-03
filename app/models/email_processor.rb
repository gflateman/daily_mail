class EmailProcessor
  def self.process(email)
    # email.to grabs an array of the recipient address before '@' sign, ie. ['digest']
    org = Organization.first #find_by_address(email.to[:token].first.to_s)
    # return unless org && org.member_emails.include?(email.from)
    org.submissions.create! body: email.to[:token].first.to_s, email: 'try one'
    org.submissions.create! body: email.to[:token].to_s, email: 'try two'
  end
end
