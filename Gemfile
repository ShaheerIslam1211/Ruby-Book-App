source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.0"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use sqlite3 as the database for Active Record
# gem "sqlite3", "~> 1.4"

# database postgresql
gem 'pg'

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

gem 'faker'

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

#Mail test ruby
gem 'mail', '~> 2.6', '>= 2.6.4'

gem 'devise'
gem 'devise-async'

# Payments
gem 'stripe'

# for environment variable gem
gem 'figaro'

gem 'jquery-rails'
gem 'jquery-ui-rails'

# Font awesome gem
# gem 'font-awesome-sass'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.7'

# Use Sass to process CSS
gem "sassc-rails"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  #Letter opener gem to be used for sending emails in development in ruby
  gem "letter_opener"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem "spring"
  gem 'binding_of_caller', '~> 0.8'
  gem 'better_errors', '~> 2.7'
  gem 'rails-erd', '~> 1.6', require: false
  gem 'pessimize', '~> 0.4', require: false
  gem 'spring-commands-rspec', '~> 1.0'
  gem 'meta_request', '~> 0.7'
  gem 'listen', '~> 3.2'
  gem 'spring-watcher-listen', '~> 2.0'
  gem 'derailed', '~> 0.1', require: false
  gem 'rubocop-rails', '~> 2.6', require: false
  gem 'annotate' # model whole schemea info in model files
  gem 'active_storage_validations' # Active storage validations
  gem 'image_processing', '~> 1.12', '>= 1.12.2' # Image processing for Active Storage
  gem 'rmagick'
end

group :development, :test do
  gem 'parallel_tests'
  gem 'pundit'
  gem 'rspec-rails'
  gem 'factory_bot_rails', require: false
  gem 'rspec_api_documentation', '~> 6.1'
  gem 'rails_best_practices', '~> 1.20', require: false
  gem 'flay', require: false # code duplication
  gem 'undercover', require: false # code coverage for current changes
  gem 'pronto', github: 'itbeaver/pronto', require: false # all in one checker
  gem 'pronto-rubocop', require: false
  gem 'pronto-undercover', github: 'misteral/pronto-undercover', require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'simplecov', require: false
  gem 'simplecov-lcov', require: false
  gem 'webmock', '~> 3.8' # mock net requests
  gem 'json_matchers', '~> 0.11' # rspec json matchers
  gem 'cuprite', '~> 0.13' # js driver for capybara
  gem 'capybara-screenshot'
  gem 'rspec-retry', '~> 0.6.2', require: false
  gem 'timecop', '~> 0.9.4'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'database_cleaner-active_record'
  gem 'rspec-collection_matchers'
  gem 'rspec-sidekiq'
end
