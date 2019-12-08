# frozen_string_literal: true

module Squeeze
  module V1
    module Incomes
      # Create incomes command
      class CreateCommand < Base::Nested::CreateCommand
        # Model scope
        def model_scope
          :incomes
        end

        # Parent scope
        def parent_scope
          :budgets
        end

        # Form class used for params validation
        def form_class
          CreateForm
        end

        # Serializer class used for json serialization
        def serializer_class
          IncomeSerializer
        end
      end
    end
  end
end
