# frozen_string_literal: true

require('test_helper')

class DummyDeleteCommand < Squeeze::V1::Base::DeleteCommand; end

module Squeeze
  module V1
    module Base
      class DeleteCommandTest < Minitest::Test
        def setup
          @command = DummyDeleteCommand.new
        end

        def test_model
          assert_raises NotImplementedError do
            @command.__send__(:model)
          end
        end
      end
    end
  end
end
