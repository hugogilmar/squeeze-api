# frozen_string_literal: true

require 'test_helper'

class DummyNestedFindCommand < Squeeze::V1::Base::Nested::FindCommand; end

module Squeeze
  module V1
    module Base
      module Nested
        class FindCommandTest < Minitest::Test
          def setup
            @command = DummyNestedFindCommand.new
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
