# frozen_string_literal: true

require('simplecov')

ENV['RAILS_ENV'] ||= 'test'
ENV['RACK_ENV'] ||= 'test'

require_relative('../config/environment')

require('minitest/autorun')
require('factory_bot')
require('faker')
require('rails/test_help')
require('rack/test')
require('sidekiq/testing')
require('support/stub_test_helpers')
require('support/token_test_helpers')

FactoryBot.find_definitions

module Minitest
  class Test
    include ActionDispatch::Assertions::ResponseAssertions
    include Rack::Test::Methods
    include StubTesttHelpers
    include TokenTestHelpers
  end
end
