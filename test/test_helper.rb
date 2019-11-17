# frozen_string_literal: true

require('factory_bot_rails')
require('simplecov')

SimpleCov.start('rails') do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/test/'
  add_group 'Commands', 'app/commands'
  add_group 'Resources', 'app/resources'
end

ENV['RAILS_ENV'] ||= 'test'
require_relative('../config/environment')
require('rails/test_help')

module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods

    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
  end
end
