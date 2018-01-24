use_smtp = Rails.env.production? || ENV.fetch('FORCE_SMTP', 'false') == 'true'

if use_smtp
  ENV['SMTP_AUTHENTICATION'] ||= 'plain'

  # Use MailGun env in Heroku
  ENV['SMTP_DOMAIN']   ||= ENV.fetch('MAILGUN_DOMAIN', 'SMTP_DOMAIN_NOT_SET)')
  ENV['SMTP_PORT']     ||= ENV.fetch('MAILGUN_SMTP_PORT', '587')
  ENV['SMTP_SERVER']   ||= ENV.fetch('MAILGUN_SMTP_SERVER', 'SMTP_SERVER_NOT_SET')
  ENV['SMTP_LOGIN']    ||= ENV.fetch('MAILGUN_SMTP_LOGIN', 'SMTP_LOGIN_NOT_SET')
  ENV['SMTP_PASSWORD'] ||= ENV.fetch('MAILGUN_SMTP_PASSWORD', 'SMTP_PASSWORD_NOT_SET')

  ActionMailer::Base.smtp_settings = {
  :port           => 587,
  :address        => "smtp.mailgun.org",
  :domain         => ENV['SMTP_DOMAIN'],
  :user_name      => ENV['SMTP_LOGIN'],
  :password       => ENV['SMTP_PASSWORD'],
  :authentication => :plain,
  }

  ActionMailer::Base.delivery_method = :smtp
  message =  "*** Using SMTP mail delivery via #{ENV['SMTP_SERVER']} "
else
  if Rails.env.test?
    ActionMailer::Base.delivery_method = :test
    message =  "*** Using local mail delivery via Test"
  else
    ActionMailer::Base.delivery_method = :smtp
    message =  "*** Using local mail delivery via Letter Opensdsdfsder"
  end
end

puts message
Rails.logger.warn message if Rails.logger
