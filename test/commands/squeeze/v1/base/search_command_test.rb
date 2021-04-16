# frozen_string_literal: true

require 'test_helper'

class DummySearchCommand < Squeeze::V1::Base::SearchCommand; end

module Squeeze
  module V1
    module Base
      class SearchCommandTest < Minitest::Test
        def setup
          @command = DummySearchCommand.new
        end

        def test_model
          assert_raises NotImplementedError do
            @command.__send__(:models)
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
end
