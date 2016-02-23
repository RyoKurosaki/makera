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

gem 'bootstrap-sass'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
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
