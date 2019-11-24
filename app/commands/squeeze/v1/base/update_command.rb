# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      # Update command base class
      class UpdateCommand < ApplicationCommand
        context id: nil

        # Command execution
        def call(params)
          if form.validate(params)
            return failure(form.model) unless form.save

            success(serializer)
          else
            failure(form)
          end
        end

        private

        # Model builder
        def model
          @model ||= model_class.find(id)
        end

        # Form builder
        def form
          @form ||= form_class.new(model)
        end

        # Serializer builder
        def serializer
          @serializer ||= serializer_class.new(form.model)
        end

        # Model class used for database persistance
        def model_class
          raise(NotImplementedError, 'model_class method not implemented')
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
