class EmailProcessor
  def self.process(email)
    Submission.create!({ body: email.body, email: email.from })
  end
end
