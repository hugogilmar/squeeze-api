# frozen_string_literal: true

source('https://rubygems.org')
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby('2.6.5')

gem('rails', '~> 6.0.0')

gem('pg', '>= 0.18', '< 2.0')
gem('puma', '~> 3.11')

gem('bootsnap', '>= 1.4.2', require: false)

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
  gem 'rubocop-minitest', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rake', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem('tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby])
