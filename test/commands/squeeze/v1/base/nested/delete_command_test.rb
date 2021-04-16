# frozen_string_literal: true

require 'test_helper'

class DummyNestedDeleteCommand < Squeeze::V1::Base::Nested::DeleteCommand; end

module Squeeze
  module V1
    module Base
      module Nested
        class DeleteCommandTest < Minitest::Test
          def setup
            @command = DummyNestedDeleteCommand.new
          end

          def test_parent_model
            assert_raises NotImplementedError do
              @command.__send__(:parent_model)
            end
          end
        end
      end
    end
  end
end
