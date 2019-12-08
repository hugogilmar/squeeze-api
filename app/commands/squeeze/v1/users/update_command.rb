# frozen_string_literal: true

module Squeeze
  module V1
    module Users
      # Update users command
      class UpdateCommand < Base::UpdateCommand
        # Model builder
        def model
          @model ||= current_user
        end

        # Form class used for params validation
        def form_class
          UpdateForm
        end

        # Serializer class used for json serialization
        def serializer_class
          UserSerializer
        end
      end
    end
  end
end
