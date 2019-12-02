# frozen_string_literal: true

module Squeeze
  module V1
    module Budgets
      # Search budgets command
      class SearchCommand < Base::SearchCommand
        private

        # Models builder
        def models
          @models ||= current_user.budgets.page(page).per(per_page)
        end

        # Serializer class used for json serialization
        def serializer_class
          BudgetSerializer
        end
      end
    end
  end
end
