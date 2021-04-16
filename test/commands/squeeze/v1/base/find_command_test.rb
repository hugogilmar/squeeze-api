# frozen_string_literal: true

require 'test_helper'

class DummyFindCommand < Squeeze::V1::Base::FindCommand; end

module Squeeze
  module V1
    module Base
      class FindCommandTest < Minitest::Test
        def setup
          @command = DummyFindCommand.new
        end

        def test_model
          assert_raises NotImplementedError do
            @command.__send__(:model)
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
