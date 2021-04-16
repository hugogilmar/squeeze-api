# frozen_string_literal: true

require 'test_helper'

class DummyUpdateCommand < Squeeze::V1::Base::UpdateCommand; end

module Squeeze
  module V1
    module Base
      class UpdateCommandTest < Minitest::Test
        def setup
          @command = DummyUpdateCommand.new
        end

        def test_model
          assert_raises NotImplementedError do
            @command.__send__(:model)
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
end
