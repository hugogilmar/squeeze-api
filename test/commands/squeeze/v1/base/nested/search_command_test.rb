# frozen_string_literal: true

require('test_helper')

class DummyNestedSearchCommand < Squeeze::V1::Base::Nested::SearchCommand; end

module Squeeze
  module V1
    module Base
      module Nested
        class SearchCommandTest < Minitest::Test
          def setup
            @command = DummyNestedSearchCommand.new
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
