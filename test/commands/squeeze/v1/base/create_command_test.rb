# frozen_string_literal: true

require('test_helper')

class DummyCommand < Squeeze::V1::Base::CreateCommand; end

module Squeeze
  module V1
    class FeatureTest < Minitest::Test
      def setup
        @command = DummyCommand.new
      end

      def test_model_class
        assert_raises NotImplementedError do
          @command.__send__(:model_class)
        end
      end

      def test_form_class
        assert_raises NotImplementedError do
          @command.__send__(:form_class)
        end
      end

      def test_serializer_class
        assert_raises NotImplementedError do
          @command.__send__(:serializer_class)
        end
      end
    end
  end
end
