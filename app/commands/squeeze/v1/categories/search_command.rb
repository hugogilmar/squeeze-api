# frozen_string_literal: true

module Squeeze
  module V1
    module Categories
      # Search categories command
      class SearchCommand < Budgets::Nested::SearchCommand
        # Models builder
        def models
          @models ||= parent_model.categories.page(page).per(per_page)
        end

        # Serializer class used for json serialization
        def serializer_class
          CategorySerializer
        end
      end
    end
  end
end
