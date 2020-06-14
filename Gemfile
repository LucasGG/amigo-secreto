# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '~> 2.6.0'

gem 'rails', '~> 5.2'

# Use postgresql as the database for Active Record
gem 'pg'

# Use Puma as the app server
gem 'puma'

# Use Redis adapter to run Action Cable in production
gem 'redis'

# Jobs
gem 'sidekiq', require: 'sidekiq/web'

# Build JSON APIs with ease
gem 'jbuilder'

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

# UI
gem 'material_icons'
gem 'materialize-sass'

# Mail
gem 'inky-rb', require: 'inky'
gem 'premailer-rails'

# Authentication framework
gem 'devise'

group :development, :test do
  gem 'byebug', platform: :mri

  # Test framework
  gem 'rspec-rails'

  # Development/test auxiliary libs
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'listen'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code
  gem 'web-console'

  # Spring speeds up development by keeping your application running in the background
  gem 'spring'
  gem 'spring-watcher-listen'

  # Cops
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end
