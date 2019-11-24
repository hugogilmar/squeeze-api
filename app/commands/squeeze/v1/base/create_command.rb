# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      # Create command base class
      class CreateCommand < ApplicationCommand
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

        def model
          @model ||= model_class.new
        end

        def form
          @form ||= form_class.new(model)
        end

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
