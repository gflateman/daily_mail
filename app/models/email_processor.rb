class EmailProcessor
  def self.process(email)
    org = Organization.find_by_address(email.to.first[:token].to_s)
    # TODO: send delivery failure email here
    return unless org && org.member_emails.include?(email.from)

    digest = org.current_digest

    existing_submission = digest.submissions.find_by_email(email.from)
    if existing_submission.nil?
      digest.submissions.create! body: email.body, email: email.from
    else
      existing_submission.body += "\n\n#{email.body}"
      existing_submission.save!
    end

  end
end
