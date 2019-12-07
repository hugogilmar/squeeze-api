# frozen_string_literal: true

module Squeeze
  module V1
    module Incomes
      # Find incomes command
      class FindCommand < Base::Nested::FindCommand
        private

        # Model builder
        def model
          @model ||= parent_model.incomes.find(resource_id)
        end

        # Parent model builder
        def parent_model
          @parent_model ||= current_user.budgets.find(parent_resource_id)
        end

        # Serializer class used for json serialization
        def serializer_class
          IncomeSerializer
        end
      end
    end
  end
end
