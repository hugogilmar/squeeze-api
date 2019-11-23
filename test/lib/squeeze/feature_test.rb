# frozen_string_literal: true

require('test_helper')

module Squeeze
  class FeatureTest < Minitest::Test
    def setup
      @user = FactoryBot.build(:user)
    end

    def test_activate
      Feature.activate(:foo)
      assert_equal(true, Feature.active?(:foo))
    end

    def test_deactivate
      Feature.activate(:foo)
      assert_equal(true, Feature.active?(:foo))
      Feature.deactivate(:foo)
      assert_equal(false, Feature.active?(:foo))
    end

    def test_for_activate_user
      Feature.activate_for_user(:foo, @user.email)
      assert_equal(true, Feature.active_for_user?(:foo, @user.email))
    end

    def test_for_deactivate_user
      Feature.activate_for_user(:foo, @user.email)
      assert_equal(true, Feature.active_for_user?(:foo, @user.email))
      Feature.deactivate_for_user(:foo, @user.email)
      assert_equal(false, Feature.active_for_user?(:foo, @user.email))
    end

    def test_activate_percentage
      Feature.activate_percentage(:foo, 100)
      assert_equal(true, Feature.active?(:foo))
    end

    def deactivate_percentage
      Feature.activate_percentage(:foo, 100)
      assert_equal(true, Feature.active?(:foo))
      Feature.deactivate_percentage(:foo)
      assert_equal(false, Feature.active?(:foo))
    end
  end
end
