# frozen_string_literal: true

module Squeeze
  module V1
    module Incomes
      # Find incomes command
      class FindCommand < Base::Nested::FindCommand
        # Model scope
        def model_scope
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
