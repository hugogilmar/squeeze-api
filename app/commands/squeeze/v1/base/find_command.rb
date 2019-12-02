# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      # Find command base class
      class FindCommand < ApplicationCommand
        context current_user: nil, resource_id: nil

        # Command execution
        def call
          success(serializer)
        end

        private

        # Model builder
        def model
          raise(NotImplementedError, 'model method not implemented')
        end

        # Serializer builder
        def serializer
          @serializer ||= ActiveModelSerializers::SerializableResource.new(model, serializer: serializer_class)
        end

        # Serializer class used for json serialization
        def serializer_class
          raise(NotImplementedError, 'serializer_class method not implemented')
        end
      end
    end
  end
end
