# frozen_string_literal: true

module Squeeze
  module V1
    module Incomes
      # Search incomes command
      class SearchCommand < Base::Nested::SearchCommand
        # Models builder
        def models
          @models ||= parent_model.incomes.page(page).per(per_page)
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
