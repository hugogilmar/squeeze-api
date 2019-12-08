# frozen_string_literal: true

module Squeeze
  module V1
    module Incomes
      # Delete incomes command
      class DeleteCommand < Base::Nested::DeleteCommand
        # Model builder
        def model
          @model ||= parent_model.incomes.find(resource_id)
        end

        # Parent model builder
        def parent_model
          @parent_model ||= current_user.budgets.find(parent_resource_id)
        end
      end
    end
  end
end
