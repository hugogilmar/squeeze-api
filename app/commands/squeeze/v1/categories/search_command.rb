# frozen_string_literal: true

module Squeeze
  module V1
    module Categories
      # Search categories command
      class SearchCommand < Base::Nested::SearchCommand
        # Models scope
        def models_scope
          :categories
        end

        # Parent scope
        def parent_scope
          :budgets
        end

        # Serializer class used for json serialization
        def serializer_class
          CategorySerializer
        end
      end
    end
  end
end
