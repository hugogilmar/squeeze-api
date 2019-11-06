module Rack
  # Health check endpoint
  class  HealthCheck
    # Build endpoint response data
    def call(env)
      status = {
        redis: {
          connected: redis_connected
        },
        postgres: {
          connected: postgres_connected,
          migrations_updated: postgres_migrations_updated
        }
      }

      [200, { 'Content-Type' => 'application/json' }, [status.to_json]]
    end

    protected

    def redis_connected
      redis = Redis.new(url: ENV['REDIS_URL'])
      redis.ping == 'PONG'
    rescue => _e
      false
    end

    def postgres_connected
      ApplicationRecord.establish_connection
      ApplicationRecord.connection
      ApplicationRecord.connected?
    rescue => _e
      false
    end

    def postgres_migrations_updated
      return false unless postgres_connected

      !ApplicationRecord.connection.migration_context.needs_migration?
    end
  end
end