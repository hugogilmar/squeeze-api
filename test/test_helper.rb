# frozen_string_literal: true

require('simplecov')

SimpleCov.minimum_coverage(90)
SimpleCov.start('rails') do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/test/'
  add_group 'Commands', 'app/commands'
  add_group 'Forms', 'app/forms'
  add_group 'Serializers', 'app/serializers'
end

ENV['RAILS_ENV'] ||= 'test'
require_relative('../config/environment')

require('factory_bot')
require('faker')
require('rails/test_help')

module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
  end
end
