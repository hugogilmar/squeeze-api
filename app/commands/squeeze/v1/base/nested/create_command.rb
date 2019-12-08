# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      module Nested
        # Create nested command base class
        class CreateCommand < PersistCommand
          private

          # Model builder
          def model
            @model ||= parent_model.__send__(model_scope).new
          end
        end
      end
    end
  end
end
