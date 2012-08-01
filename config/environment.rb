# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Powistry::Application.initialize!

# setting mail protocol for heroku (sendgrid)
config.action_mailer.delivery_method = :smtp

# in order to raise errors on mail delivery
config.action_mailer.raise_delivery_errors = true
