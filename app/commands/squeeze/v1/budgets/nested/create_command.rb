# frozen_string_literal: true

module Squeeze
  module V1
    module Budgets
      module Nested
        # Create categories command
        class CreateCommand < Base::Nested::CreateCommand
          # Parent model builder
          def parent_model
            @parent_model ||= current_user.budgets.find(parent_resource_id)
          end
        end
      end
    end
  end
end
