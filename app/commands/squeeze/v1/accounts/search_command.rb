# frozen_string_literal: true

module Squeeze
  module V1
    module Accounts
      # Search accounts command
      class SearchCommand < Base::SearchCommand
        # Models scope
        def models_scope
          :accounts
        end

        # Serializer class used for json serialization
        def serializer_class
          AccountSerializer
        end
      end
    end
  end
end
