# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
DmcPrototype::Application.initialize!

ActionMailer::Base.smtp_settings = {
:address => 'wp392.webpack.hosteurope.de',
:port => 587,
:user_name => "wp11160188-proofler",
:password => "proofler",
:authentication => :plain,
:enable_starttls_auto => true,
:openssl_verify_mode => 'none' 
}
