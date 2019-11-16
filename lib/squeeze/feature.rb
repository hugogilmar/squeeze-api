require 'singleton'
require 'forwardable'

module Squeeze
  class Feature
    include Singleton

    def initialize
      @redis = Redis.new
      @rollout = Rollout.new(@redis)
    end

    def active?(feature)
      @rollout.active?(feature)
    end

    def active_for_user?(feature, user)
      @rollout.active?(feature, user)
    end

    def activate(feature)
      @rollout.activate(feature)
    end

    def activate_for_user(feature, user)
      @rollout.activate_user(feature, user)
    end

    def deactivate(feature)
      @rollout.deactivate(feature)
    end

    def deactivate_for_user(feature, user)
      @rollout.deactivate_user(feature, user)
    end

    def activate_percentage(feature, percentage)
      @rollout.activate_percentage(feature, percentage)
    end

    def deactivate_percentage(feature)
      @rollout.deactivate_percentage(feature)
    end

    class << self
      extend Forwardable
      def_delegators :instance, *Feature.instance_methods(false)
    end
  end
end
