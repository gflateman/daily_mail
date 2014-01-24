namespace :digest do

  desc "Delivers Daily Digest"
  task :deliver => :environment do
    Organization.all.each do |org|
      digest = org.current_digest
      digest.deliver if digest.deliverable?
    end
  end

  desc "Delivers Daily Digest Reminder"
  task :reminder => :environment do
    Organization.all.each do |org|
      digest = org.current_digest
      digest.send_reminder if digest.remindable?
    end
  end

  task :test => :environment do
    Organization.all.each do |org|
      digest = org.current_digest
      puts digest.deliverable?
      puts digest.remindable?
    end
  end

end
