source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

#slim
gem 'slim-rails'
gem 'html2slim'

gem 'pg', '0.17.1'

gem 'puma'

# User Authorization
gem 'devise'
gem 'cancancan'
gem 'rails_admin'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Sidekiq
gem 'sidekiq'
gem 'sinatra', require: false

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

source 'https://rails-assets.org' do
  gem 'rails-assets-fullcalendar'
  gem 'rails-assets-fullcalendar-scheduler'
end
