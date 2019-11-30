# frozen_string_literal: true

require('test_helper')
require('rack/test')
require('squeeze/rack/health_check')

module Squeeze
  module Rack
    class HealthCheckTest < Minitest::Test
      include ::Rack::Test::Methods

      def app
        HealthCheck.new
      end

      def test_app
        get('/')
        assert(last_response.ok?)
      end
    end
  end
end
