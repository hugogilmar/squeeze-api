# frozen_string_literal: true

module Rack
  # Health check endpoint
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
          connected: postgres_connected,
          migrations_updated: postgres_migrations_updated
        }
      }
    end

    def redis_connected
      redis = Redis.new(url: ENV['REDIS_URL'])
      redis.ping == 'PONG'
    rescue Redis::BaseConnectionError
      false
    end

    def postgres_connected
      Squeeze::ApplicationRecord.establish_connection
      Squeeze::ApplicationRecord.connection
      Squeeze::ApplicationRecord.connected?
    rescue PG::Error
      false
    end

    def postgres_migrations_updated
      return false unless postgres_connected

      !Squeeze::ApplicationRecord.connection.migration_context.needs_migration?
    end
  end
end
