namespace :digest do
  desc "Delivers Daily Digest"
  task :deliver => :environment do
    Organization.all.each do |org|
      DigestMailer.daily_digest(org.id).deliver
    end
  end
end
