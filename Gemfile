source 'https://rubygems.org'

gem 'rails', '3.2.8'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'data_mapper', "~> 1.2.0"
gem 'dm-rails'

gem 'jquery-rails'

# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

group :production do
  gem 'dm-postgres-adapter'
end

group :test, :development do
  gem 'dm-sqlite-adapter'
  gem 'cucumber-rails', :require => false
  # gem 'database_cleaner'
  gem 'rspec-rails', "~> 2.0"
  gem 'capybara'
  gem 'guard-jasmine'
  gem 'jasminerice'
  gem 'simplecov', :require => false
end
