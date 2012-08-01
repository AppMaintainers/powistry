# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Powistry::Application.initialize!

# in order to raise errors on mail delivery
# config.action_mailer.raise_delivery_errors = true
