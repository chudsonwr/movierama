# Load the Rails application.
require File.expand_path('../application', __FILE__)

Rails.application.configure do
  config.autoload_paths += %W(#{config.root}/app/services)

  config.middleware.use ActionDispatch::Flash
  config.middleware.insert 0, Rack::SSL
end

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => ENV['base_smtp_password'], # TODO: Use AWS KMS or other encryption service to encrypt/decrypt serets
  :domain => 'movierama.dev',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}