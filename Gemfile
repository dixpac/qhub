source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 5.2.0.rc2'
gem 'pg', '>= 1.0.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'devise', '~> 4.4'
gem 'omniauth-google-oauth2', '~> 0.5'

gem 'jquery-rails'
gem 'bootstrap', '~> 4.0.0'
gem 'font-awesome-sass', '~> 5.0.6'

gem 'local_time'

# Markdown sanitization dependencies
gem 'redcarpet'

gem 'kaminari', '~> 1.1.1'

# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'
gem "aws-sdk-s3", require: false

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

#Background job processing
gem 'sidekiq', '~> 5.1'

# Full-text search
gem 'searchkick'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rack-mini-profiler', require: false
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
