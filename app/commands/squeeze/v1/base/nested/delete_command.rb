# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      module Nested
        # Delete nested command base class
        class DeleteCommand < MemberCommand
          # Command execution
          def call
            model.destroy!

            success(model)
          end
        end
      end
    end
  end
end
