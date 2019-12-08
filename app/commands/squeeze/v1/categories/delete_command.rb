# frozen_string_literal: true

module Squeeze
  module V1
    module Categories
      # Delete categories command
      class DeleteCommand < Base::Nested::DeleteCommand
        # Model builder
        def model
          @model ||= parent_model.categories.find(resource_id)
        end

        # Parent model builder
        def parent_model
          @parent_model ||= current_user.budgets.find(parent_resource_id)
        end
      end
    end
  end
end
