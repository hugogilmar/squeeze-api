# frozen_string_literal: true

require 'test_helper'

class DummyNestedUpdateCommand < Squeeze::V1::Base::Nested::UpdateCommand; end

module Squeeze
  module V1
    module Base
      module Nested
        class UpdateCommandTest < Minitest::Test
          def setup
            @command = DummyNestedUpdateCommand.new
          end

          def test_parent_model
            assert_raises NotImplementedError do
              @command.__send__(:parent_model)
            end
          end

          def test_form_class
            assert_raises NotImplementedError do
              @command.__send__(:form_class)
            end
          end
        end
      end
    end
  end
end
