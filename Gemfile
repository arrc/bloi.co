source 'https://rubygems.org'
ruby '2.3.1'

#---------------------------- CUSTOM
gem 'devise', '~> 4.2' # rails g devise:install
gem 'ransack', '~> 1.8'
gem 'foundation-rails' # rails d foundation:install
gem 'compass-rails'
gem 'chosen-rails'
gem 'simple_form' # rails g simple_form:install --foundation
gem "select2-rails"
gem "selectize-rails"
gem 'friendly_id', github: 'norman/friendly_id'
gem 'dotenv-rails'
gem "figaro" # bundle exec figaro install
gem "carrierwave"
gem "fog"
gem "mini_magick"
gem 'rails-assets-ionicons', source: 'https://rails-assets.org'
gem 'rails-assets-noty', source: 'https://rails-assets.org'
gem 'rails-assets-scrollreveal', source: 'https://rails-assets.org'
gem 'will_paginate'
gem 'unicorn', group: :production
#---------------------------- CUSTOM END

gem 'rails', '~> 5.0.0'
# gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # CUSTOM
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'bullet', '~> 5.1' # set config/environments/development.rb
  gem 'meta_request'
  gem "better_errors"
  # gem "binding_of_caller"
  gem 'rails-footnotes', '~> 4.0' # rails generate rails_footnotes:install
  gem 'annotate' # bundle exec annotate --exclude tests,fixtures,factories,serializers
  gem 'awesome_print', '~> 1.7', require:"ap" # ap Model.first
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
