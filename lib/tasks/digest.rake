namespace :digest do
  desc "Delivers Daily Digest"
  task :deliver => :environment do
     DigestMailer.daily_digest.deliver
  end
end
