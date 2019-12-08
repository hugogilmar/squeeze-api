# frozen_string_literal: true

module Squeeze
  module V1
    module Categories
      # Find categories command
      class FindCommand < Base::Nested::FindCommand
        # Model scope
        def model_scope
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
