class EmailProcessor
  def self.process(email)
    return unless email.to == 'digest@richardpic.com'
    Submission.create!({ body: email.body, email: email.from })
  end
end
