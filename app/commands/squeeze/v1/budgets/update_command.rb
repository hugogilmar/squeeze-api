# frozen_string_literal: true

module Squeeze
  module V1
    module Budgets
      # Update budgets command
      class UpdateCommand < Base::UpdateCommand
        private

        # Model builder
        def model
          @model ||= current_user.budgets.find(resource_id)
        end

        # Form class used for params validation
        def form_class
          UpdateForm
        end

        # Serializer class used for json serialization
        def serializer_class
          BudgetSerializer
        end
      end
    end
  end
end
