# frozen_string_literal: true

module Squeeze
  module V1
    module Expenses
      # Search expenses command
      class SearchCommand < Base::Nested::SearchCommand
        # Models scope
        def models_scope
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
