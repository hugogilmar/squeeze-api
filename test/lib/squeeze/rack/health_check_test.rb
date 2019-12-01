# frozen_string_literal: true

require('test_helper')
require('rack/test')
require('squeeze/rack/health_check')

module Squeeze
  module Rack
    class HealthCheckTest < Minitest::Test
      def app
        HealthCheck.new
      end

      def test_app
        get('/')
        assert(last_response.ok?)
      end

      def test_redis_exception
        raises_exception = -> { raise Redis::BaseConnectionError.new }
        stub_any_instance(Redis, :ping, raises_exception) do
          get('/')
          assert(last_response.ok?)
        end
      end

      def test_postgres_exception
        raises_exception = -> { raise PG::Error.new }
        ApplicationRecord.stub(:establish_connection, raises_exception) do
          get('/')
          assert(last_response.ok?)
        end
      end
    end
  end
end
