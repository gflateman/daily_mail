Griddler.configure do |config|
  # config.processor_class = EmailProcessor # MyEmailProcessor
  config.to = :token # :full, :email, :hash
  # :raw    => 'AppName <s13.6b2d13dc6a1d33db7644@mail.myapp.com>'
  # :email  => 's13.6b2d13dc6a1d33db7644@mail.myapp.com'
  # :token  => 's13.6b2d13dc6a1d33db7644'
  # :hash   => { raw: '', email: '', token: '', host: '' }
  # config.reply_delimiter = '-- REPLY ABOVE THIS LINE --'
  # config.email_service = :sendgrid
end
