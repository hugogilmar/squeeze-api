# frozen_string_literal: true

module Squeeze
  module V1
    module Accounts
      # Update accounts command
      class UpdateCommand < Base::UpdateCommand
        private

        # Model builder
        def model
          @model ||= current_user.accounts.find(resource_id)
        end

        # Form class used for params validation
        def form_class
          UpdateForm
        end

        # Serializer class used for json serialization
        def serializer_class
          AccountSerializer
        end
      end
    end
  end
end
