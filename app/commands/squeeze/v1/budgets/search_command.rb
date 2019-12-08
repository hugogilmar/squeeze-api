# frozen_string_literal: true

module Squeeze
  module V1
    module Budgets
      # Search budgets command
      class SearchCommand < Base::SearchCommand
        # Models scope
        def models_scope
          :budgets
        end

        # Serializer class used for json serialization
        def serializer_class
          BudgetSerializer
        end
      end
    end
  end
end
