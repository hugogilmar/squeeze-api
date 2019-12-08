# frozen_string_literal: true

module Squeeze
  module V1
    module Operations
      # Search operations command
      class SearchCommand < Base::Nested::SearchCommand
        # Models scope
        def models_scope
          :operations
        end

        # Parent scope
        def parent_scope
          :accounts
        end

        # Serializer class used for json serialization
        def serializer_class
          OperationSerializer
        end
      end
    end
  end
end
