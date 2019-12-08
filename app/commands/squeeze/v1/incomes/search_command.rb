# frozen_string_literal: true

module Squeeze
  module V1
    module Incomes
      # Search incomes command
      class SearchCommand < Base::Nested::SearchCommand
        # Models scope
        def models_scope
          :incomes
        end

        # Parent scope
        def parent_scope
          :budgets
        end

        # Serializer class used for json serialization
        def serializer_class
          IncomeSerializer
        end
      end
    end
  end
end
