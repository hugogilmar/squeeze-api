# frozen_string_literal: true

module Squeeze
  module V1
    module Accounts
      # Create accounts command
      class CreateCommand < Base::CreateCommand
        private

        # Model builder used for database persistance
        def model
          @model ||= current_user.accounts.new
        end

        # Form class used for params validation
        def form_class
          CreateForm
        end

        # Serializer class used for json serialization
        def serializer_class
          AccountSerializer
        end
      end
    end
  end
end
