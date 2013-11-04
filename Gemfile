source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record in development and test enviroment
group :development, :test do
  gem 'sqlite3'
end
group :development do 
   gem 'guard-rspec', require: false
   gem 'terminal-notifier-guard', require:false
   gem 'libnotify', require:false
end

# Use PostgreSQL as the database for Active Record in development
group :production do
   gem 'pg'
   gem 'rails_stdout_logging' 
   # Heroku requires this
   gem 'rails_12factor' 
end

#
gem 'angularjs-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# SASS for bootstrap
gem 'bootstrap-sass-rails', '>= 3.0.0.2'

# For jquery to play nicely with turbolinks
gem 'jquery-turbolinks'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'devise'

# Testing libraries

# Use rspec as testing framework
group :development, :test do
  gem 'rspec-rails', '~> 2.0'
end

# Generate fixtures to tests with Factory Girl
group :test do
  # fixtures in tests
  gem 'factory_girl_rails'
  # Headless browser testing
  gem 'capybara'
  gem 'launchy'
  # Coverage
  gem 'simplecov', :require => false
end



# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
gem 'debugger', group: [:development, :test]
gem 'table_print'