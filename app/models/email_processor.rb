class EmailProcessor
  def self.process(email)
    puts '///////////////////////'
    puts '///////////////////////'
    puts email.to
    puts '///////////////////////'
    puts '///////////////////////'
    # return unless email.to == 'digest@richardpic.com'
    Submission.create!({ body: email.body, email: email.from })
  end
end
