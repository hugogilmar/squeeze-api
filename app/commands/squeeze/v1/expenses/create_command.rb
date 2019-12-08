# frozen_string_literal: true

module Squeeze
  module V1
    module Expenses
      # Create expenses command
      class CreateCommand < Base::Nested::CreateCommand
        # Model builder
        def model
          @model ||= parent_model.expenses.new
        end

        # Parent model builder
        def parent_model
          @parent_model ||= current_user.budgets.find(parent_resource_id)
        end

        # Form class used for params validation
        def form_class
          CreateForm
        end

        # Serializer class used for json serialization
        def serializer_class
          ExpenseSerializer
        end
      end
    end
  end
end
