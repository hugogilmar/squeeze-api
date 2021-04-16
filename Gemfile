# frozen_string_literal: true

source'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'rails', '~> 6.1'

gem 'hiredis', '~> 0.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12')
gem 'redis', '~> 4.1', require: ['redis', 'redis/connection/hiredis']
gem 'redis-namespace', '~> 1.7'

gem 'active_model_serializers', '~> 0.10'
gem 'bcrypt', '~> 3.1'
gem 'discard', '~> 1.1'
gem 'jwt', '~> 2.2'
gem 'kaminari', '~> 1.1'
gem 'pathway', '~> 0.10'
gem 'reform-rails', '~> 0.1'
gem 'rollout', '~> 2.4'
gem 'sidekiq', '~> 6.0'
gem 'warden', '~> 1.2'

gem 'bootsnap', '~> 1.4', require: false
gem 'tzinfo-data', '~> 1.2', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'brakeman', '~> 4.7', require: false
  gem 'byebug', '~> 11.0', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 5.1', require: false
  gem 'faker', '~> 2.7', require: false
  gem 'rubocop', '~> 0.76', require: false
  gem 'simplecov', '~> 0.17', require: false
end

group :development do
  gem 'listen', '>= 3.0', '< 3.2'
  gem 'spring', '~> 2.1'
  gem 'spring-watcher-listen', '~> 2.0'
end
