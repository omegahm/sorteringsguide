source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails'

gem 'actionpack-action_caching'
gem 'asset_sync'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass'
gem 'coffee-rails'
gem 'dalli'
gem 'devise'
gem 'exception_notification'
gem 'geokit-rails'
gem 'haml'
gem 'jbuilder'
gem 'jquery-rails'
gem 'knockoutjs-rails'
gem 'memcachier'
gem 'newrelic_rpm'
gem 'paperclip'
gem 'pg'
gem 'rack-timeout'
gem 'rails-i18n', '~> 4.0.0.pre'
gem 'sass-rails'
gem 'uglifier'
gem 'unicorn-rails'
gem 'yui-compressor'

group :production do
  gem 'justonedb'
  gem 'rails_12factor' # required by Heroku
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'foreman'
  gem 'hirb'
  gem 'lol_dba' # To find table in need of indexes run 'lol_dba db:find_indexes'
  gem 'mailcatcher'
  gem 'pry'
  gem 'quiet_assets'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'factory_girl_rails', require: false
  gem 'fuubar'
  gem 'rspec-rails'
end
