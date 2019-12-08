# frozen_string_literal: true

module Squeeze
  module V1
    module Budgets
      # Create budgets command
      class CreateCommand < Base::CreateCommand
        # Model scope
        def model_scope
          :budgets
        end

        # Form class used for params validation
        def form_class
          CreateForm
        end

        # Serializer class used for json serialization
        def serializer_class
          BudgetSerializer
        end
      end
    end
  end
end
