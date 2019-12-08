# frozen_string_literal: true

module Squeeze
  module V1
    module Accounts
      # Update accounts command
      class UpdateCommand < Base::UpdateCommand
        # Model scope
        def model_scope
          :accounts
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
