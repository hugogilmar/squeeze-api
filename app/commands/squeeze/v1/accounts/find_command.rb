# frozen_string_literal: true

module Squeeze
  module V1
    module Accounts
      # Find accounts command
      class FindCommand < Base::FindCommand
        # Model scope
        def model_scope
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
