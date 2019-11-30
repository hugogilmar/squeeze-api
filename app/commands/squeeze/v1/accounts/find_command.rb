# frozen_string_literal: true

module Squeeze
  module V1
    module Accounts
      # Find accounts command
      class FindCommand < Base::FindCommand
        private

        # Model builder
        def model
          @model ||= current_user.accounts.find(resource_id)
        end

        # Serializer class used for json serialization
        def serializer_class
          AccountSerializer
        end
      end
    end
  end
end
