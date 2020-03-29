# frozen_string_literal: true

source('https://rubygems.org')
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby('2.6.5')

gem('rails', '~> 6.0.0')

gem('hiredis', '~> 0.6.3')
gem('pg', '>= 0.18', '< 2.0')
gem('puma', '~> 3.12.1')
gem('redis', '~> 4.1.3', require: ['redis', 'redis/connection/hiredis'])
gem('redis-namespace', '~> 1.7.0')

gem('active_model_serializers', '~> 0.10.10')
gem('bcrypt', '~> 3.1.13')
gem('discard', '~> 1.1.0')
gem('jwt', '~> 2.2.1')
gem('kaminari', '~> 1.1.1')
gem('pathway', '~> 0.10.0')
gem('reform-rails', '~> 0.1.7')
gem('rollout', '~> 2.4.5')
gem('sidekiq', '~> 6.0.3')
gem('uuid', '~> 2.3.9')
gem('warden', '~> 1.2.8')

gem('bootsnap', '~> 1.4.2', require: false)
gem('tzinfo-data', '~> 1.2.5', platforms: %i[mingw mswin x64_mingw jruby])

group :development, :test do
  gem('brakeman', '~> 4.7.1', require: false)
  gem('byebug', '~> 11.0.1', platforms: %i[mri mingw x64_mingw])
  gem('factory_bot_rails', '~> 5.1.1', require: false)
  gem('faker', '~> 2.7.0', require: false)
  gem('rubocop', '~> 0.76.0', require: false)
  gem('simplecov', '~> 0.17.1', require: false)
end

group :development do
  gem('listen', '>= 3.0.5', '< 3.2')
  gem('spring', '~> 2.1.0')
  gem('spring-watcher-listen', '~> 2.0.0')
end
