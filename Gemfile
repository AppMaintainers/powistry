source 'https://rubygems.org'

gem 'rails', '3.2.11'

gem "simple_form"
gem "devise"
gem 'rails_admin'
gem 'cancan'
gem 'ransack'
gem 'jquery-rails'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'pg'

group :development do
  gem 'foreman'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
end

group :development, :test do
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'guard-annotate'
  gem 'guard-livereload'
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :production do
  gem 'unicorn'
  gem 'newrelic_rpm'
end
