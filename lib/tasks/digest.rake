namespace :digest do

  desc "Delivers Daily Digest"
  task :deliver => :environment do
    send_digest_on_weekdays
  end

  desc "Delivers Daily Digest Reminder"
  task :reminder => :environment do
    send_reminder_on_weekdays
  end

  def send_digest_on_weekdays
    today = Date.today
    return if today.saturday? or today.sunday?
    Organization.all.map(&:send_digest)
  end

  def send_reminder_on_weekdays
    tomorrow = Date.tomorrow
    return if tomorrow.saturday? or tomorrow.sunday?
    Organization.all.map(&:send_reminder)
  end

end
