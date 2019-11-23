# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      # Create command base class
      class CreateCommand < ApplicationCommand
        def call(params)
          model = model_class.new
          form = form_class.new(model)

          if form.validate(params)
            if form.save
              success(serializer_class.new(form.model))
            else
              failure(form.model)
            end
          else
            failure(form)
          end
        end

        private

        def model_class
          raise NotImplementedError, 'model_class method not implemented'
        end

        def form_class
          raise NotImplementedError, 'form_class method not implemented'
        end

        def serializer_class
          raise NotImplementedError, 'serializer_class method not implemented'
        end
      end
    end
  end
end
