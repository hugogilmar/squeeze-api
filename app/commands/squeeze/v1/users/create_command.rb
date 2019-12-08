# frozen_string_literal: true

module Squeeze
  module V1
    module Users
      # Create users command
      class CreateCommand < Base::CreateCommand
        # Model builder
        def model
          @model ||= User.new
        end

        # Form class used for params validation
        def form_class
          CreateForm
        end

        # Serializer class used for json serialization
        def serializer_class
          UserSerializer
        end
      end
    end
  end
end
