namespace :digest do
  desc "Delivers Daily Digest"
  task :deliver => :environment do
    send_on_weekdays
  end

  def send_on_weekdays
    today = Date.today
    return if today.saturday? or today.sunday?
    Organization.all.each do |org|
      DigestMailer.digest(org.id, Chronic.parse('last weekday at 7 AM')).deliver
    end
  end
end
