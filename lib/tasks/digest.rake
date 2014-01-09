namespace :digest do

  desc "Delivers Daily Digest"
  task :deliver => :environment do
    Organization.all.each do |org|
      org.deliver_digest if org.should_deliver_digest?(Date.today)
    end
  end

  desc "Delivers Daily Digest Reminder"
  task :reminder => :environment do
    Organization.all.each do |org|
      org.deliver_reminder if org.should_deliver_digest?(Date.tomorrow)
    end
  end

end
