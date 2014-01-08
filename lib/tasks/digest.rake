namespace :digest do
  desc "Delivers Daily Digest"
  task :deliver => :environment do
    send_digest_on_weekdays
  end

  task :reminder => :environment do
    send_reminder_on_weekdays
  end


  def send_digest_on_weekdays
    today = Date.today
    return if today.saturday? or today.sunday?
    Organization.all.each do |org|
      DigestMailer.digest(org.id, Chronic.parse('last weekday at 7 AM')).deliver
    end
  end

  def send_reminder_on_weekdays
    tomorrow = Date.tomorrow
    return if tomorrow.saturday? or tomorrow.sunday?
    Organization.all.each do |org|
      unsubmitted_emails = org.unsubmitted_emails_since Chronic.parse('today at 7 AM')
      DigestMailer.reminder(org.id, unsubmitted_emails).deliver
    end
  end

end
