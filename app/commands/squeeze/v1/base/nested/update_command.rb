# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      module Nested
        # Update nested command base class
        class UpdateCommand < Base::UpdateCommand
          context current_user: nil, parent_resource_id: nil, resource_id: nil

          private

          # Parent model builder
          def parent_model
            raise(NotImplementedError, 'parent model method not implemented')
          end
        end
      end
    end
  end
end
