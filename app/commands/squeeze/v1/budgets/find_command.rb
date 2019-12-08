# frozen_string_literal: true

module Squeeze
  module V1
    module Budgets
      # Find budgets command
      class FindCommand < Base::FindCommand
        # Model scope
        def model_scope
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
