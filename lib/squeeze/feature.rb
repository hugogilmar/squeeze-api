# frozen_string_literal: true

require('singleton')
require('forwardable')

module Squeeze
  # Feature flipper singleton
  class Feature
    include Singleton

    # Initialize redis and rollout
    def initialize
      @redis = Redis.new
      @rollout = Rollout.new(@redis)
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
