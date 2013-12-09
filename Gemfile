source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.1' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails
gem 'table_print'
gem 'devise' # Use ActiveModel has_secure_password
gem 'jbuilder', '~> 1.2' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'rack-cors', :require => 'rack/cors' # Make CORS possible
# Use sqlite3 as the database for Active Record in development and test enviroment
gem 'aes', '~> 0.5.0'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 2.0'
  #gem 'debugger'
end

group :development do 
   gem 'guard-rspec', require: false # Test-watch tool
   gem 'terminal-notifier-guard', require:false # Guard popups for OSX
   gem 'libnotify', require:false # Guard popups for linux
end

group :production do
   gem 'pg' # Use PostgreSQL as the database for Active Record in development
   gem 'rails_stdout_logging' 
   gem 'rails_12factor' # Heroku requires this
end

group :doc do
  gem 'sdoc', require: false # bundle exec rake doc:rails generates the API under doc/api.
end

group :test do
  gem 'factory_girl_rails' # Generate fixtures to tests with Factory Girl
  gem 'capybara' # Headless browser testing
  gem 'launchy' 
  gem 'simplecov', :require => false # Coverage
end