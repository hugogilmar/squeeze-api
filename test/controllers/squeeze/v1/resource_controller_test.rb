# frozen_string_literal: true

require('test_helper')

class DummyResourceController < Squeeze::V1::ApplicationController; end

module Squeeze
  module V1
    class ResourceControllerTest < Minitest::Test
      def setup
        @controller = DummyResourceController.new
      end

      def test_resource_permitted_params
        assert_raises NotImplementedError do
          @controller.__send__(:resource_permitted_params)
        end
      end

      def test_resource_filter_permitted_params
        assert_raises NotImplementedError do
          @controller.__send__(:resource_filter_permitted_params)
        end
      end
    end
  end
end
