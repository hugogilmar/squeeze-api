# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      # Delete command base class
      class DeleteCommand < ApplicationCommand
        context current_user: nil, resource_id: nil

        # Command execution
        def call
          model.destroy!

          success(model)
        end

        private

        # Model builder
        def model
          @model ||= current_user.__send__(model_scope).find(resource_id)
        end

        # Model scope
        def model_scope
          raise(NotImplementedError, 'model_scope method not implemented')
        end
      end
    end
  end
end
