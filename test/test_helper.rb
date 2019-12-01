# frozen_string_literal: true

require('simplecov')

SimpleCov.start('rails') do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/test/'
  add_group 'Commands', 'app/commands'
  add_group 'Forms', 'app/forms'
  add_group 'Serializers', 'app/serializers'
end

ENV['RAILS_ENV'] ||= 'test'
ENV['RACK_ENV'] ||= 'test'
require_relative('../config/environment')

require('minitest/autorun')
require('factory_bot')
require('faker')
require('rails/test_help')
require('rack/test')
require('support/stub_test_helpers')
require('support/token_test_helpers')

FactoryBot.find_definitions

module ActiveSupport
  class TestCase
    include Rack::Test::Methods
    include StubTesttHelpers
    include TokenTestHelpers
  end
end

module Minitest
  class Test
    include Rack::Test::Methods
    include StubTesttHelpers
    include TokenTestHelpers
  end
end
