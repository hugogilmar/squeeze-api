# frozen_string_literal: true

require 'forwardable'
require 'singleton'

module Squeeze
  # Feature flipper singleton
  class Feature
    include Singleton

    # Initialize redis and rollout
    def initialize
      @rollout = Rollout.new(redis)
    end

    # Redis connection instance
    def redis
      @redis ||= Redis.new(url: redis_url)
    end

    # Redis URL configuration
    def redis_url
      config_file = Rails.root.join('config', 'redis.yml')
      return ENV['REDIS_URL'] unless File.exist?(config_file)

      config = YAML.safe_load(ERB.new(File.read(config_file)).result)[Rails.env]
      config.fetch('url')
    end

    # Check if feature is globally active
    def active?(feature)
      @rollout.active?(feature)
    end

    # Check if feature is active for user
    def active_for_user?(feature, user)
      @rollout.active?(feature, user)
    end

    # Activate feature globally
    def activate(feature)
      @rollout.activate(feature)
    end

    # Activate feature for user
    def activate_for_user(feature, user)
      @rollout.activate_user(feature, user)
    end

    # Deactivate feature globally
    def deactivate(feature)
      @rollout.deactivate(feature)
    end

    # Deactivate feature for user
    def deactivate_for_user(feature, user)
      @rollout.deactivate_user(feature, user)
    end

    # Activate feature percentage
    def activate_percentage(feature, percentage)
      @rollout.activate_percentage(feature, percentage)
    end

    # Deactivate feature percentage
    def deactivate_percentage(feature)
      @rollout.deactivate_percentage(feature)
    end

    class << self
      extend Forwardable
      def_delegators :instance, *Feature.instance_methods(false)
    end
  end
end
