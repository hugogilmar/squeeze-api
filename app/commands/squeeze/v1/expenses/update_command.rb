# frozen_string_literal: true

module Squeeze
  module V1
    module Expenses
      # Update expenses command
      class UpdateCommand < Base::Nested::UpdateCommand
        # Model scope
        def model_scope
          :expenses
        end

        # Parent scope
        def parent_scope
          :budgets
        end

        # Form class used for params validation
        def form_class
          UpdateForm
        end

        # Serializer class used for json serialization
        def serializer_class
          ExpenseSerializer
        end
      end
    end
  end
end
