# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      # Create command base class
      class CreateCommand < ApplicationCommand
        context current_user: nil

        # Command execution
        def call(params)
          raise(ActiveRecord::RecordInvalid, form) unless form.validate(params)

          form.sync
          form.model.save!
          success(serializer)
        end

        private

        # Model builder
        def model
          @model ||= current_user.__send__(model_scope).new
        end

        # Model scope
        def model_scope
          raise(NotImplementedError, 'model_scope method not implemented')
        end

        # Form builder
        def form
          @form ||= form_class.new(model)
        end

        # Serializer builder
        def serializer
          @serializer ||= ActiveModelSerializers::SerializableResource.new(model, serializer: serializer_class)
        end

        # Form class used for params validation
        def form_class
          raise(NotImplementedError, 'form_class method not implemented')
        end

        # Serializer class used for json serialization
        def serializer_class
          raise(NotImplementedError, 'serializer_class method not implemented')
        end
      end
    end
  end
end
