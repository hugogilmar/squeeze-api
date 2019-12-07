# frozen_string_literal: true

module Squeeze
  module V1
    module Expenses
      # Find expenses command
      class FindCommand < Base::Nested::FindCommand
        private

        # Model builder
        def model
          @model ||= parent_model.expenses.find(resource_id)
        end

        # Parent model builder
        def parent_model
          @parent_model ||= current_user.budgets.find(parent_resource_id)
        end

        # Serializer class used for json serialization
        def serializer_class
          ExpenseSerializer
        end
      end
    end
  end
end
