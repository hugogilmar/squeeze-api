# frozen_string_literal: true

require('test_helper')

class DummyNestedCreateCommand < Squeeze::V1::Base::Nested::CreateCommand; end

module Squeeze
  module V1
    module Base
      module Nested
        class CreateCommandTest < Minitest::Test
          def setup
            @command = DummyNestedCreateCommand.new
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
