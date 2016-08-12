source 'https://rubygems.org'

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
#---------------------------- CUSTOM END

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
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
