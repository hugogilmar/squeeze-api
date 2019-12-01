# frozen_string_literal: true

module Squeeze
  module V1
    module Budgets
      # Create budgets command
      class CreateCommand < Base::CreateCommand
        private

        # Model builder used for database persistance
        def model
          @model ||= current_user.budgets.new
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
