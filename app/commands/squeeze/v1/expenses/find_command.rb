# frozen_string_literal: true

module Squeeze
  module V1
    module Expenses
      # Find expenses command
      class FindCommand < Base::Nested::FindCommand
        # Model scope
        def model_scope
          :expenses
        end

        # Parent scope
        def parent_scope
          :budgets
        end

        # Serializer class used for json serialization
        def serializer_class
          ExpenseSerializer
        end
      end
    end
  end
end
