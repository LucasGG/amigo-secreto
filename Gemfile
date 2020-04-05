# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '~> 2.6.0'
gem 'rails', '~> 5.0'

# Use postgresql as the database for Active Record
gem 'pg'

# Use Puma as the app server
gem 'puma'

# Use SCSS for stylesheets
gem 'sassc-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes navigating your web application faster
gem 'turbolinks'

# Build JSON APIs with ease
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis'

# Jobs
gem 'sidekiq', require: 'sidekiq/web'

# Authentication framework
gem 'devise'

# UI
gem 'material_icons'
gem 'materialize-sass'

# Mail
gem 'inky-rb', require: 'inky'
gem 'premailer-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to get a debugger console
  gem 'byebug', platform: :mri

  # WARNING: Need to be in dev/test group because rake tasks
  # Test framework
  gem 'rspec-rails'
end

group :development do
  # Access an IRB console on exception pages or by using
  # <%= console %> anywhere in the code
  gem 'listen'
  gem 'web-console', '>= 3.3.0'

  # Spring speeds up development by keeping your application running
  # in the background
  gem 'spring'
  gem 'spring-watcher-listen'

  # Cops
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  # Test auxiliary libs
  gem 'factory_bot_rails'
  gem 'faker'
end
