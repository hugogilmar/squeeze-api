# frozen_string_literal: true

module Squeeze
  module Rack
    module App
      # Health check app
      class HealthCheck
        # Build endpoint response data
        def call(_env)
          [200, headers, [body.to_json]]
        end

        protected

        def headers
          # rubocop:disable Style/StringHashKeys
          {
            'Content-Type' => 'application/json'
          }
          # rubocop:enable Style/StringHashKeys
        end

        def body
          {
            redis: {
              connected: redis_connected
            },
            postgres: {
              connected: postgres_connected
            }
          }
        end

        def redis_connected
          Redis.new(url: ENV['REDIS_URL']).ping == 'PONG'
        rescue Redis::BaseConnectionError, Errno::ECONNREFUSED
          false
        end

        def postgres_connected
          PG::Connection.ping(ENV['DATABASE_URL']) == PG::PQPING_OK
        rescue PG::Error, PG::ConnectionBad
          false
        end
      end
    end
  end
end
