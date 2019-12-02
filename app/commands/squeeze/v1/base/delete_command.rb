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
          raise(NotImplementedError, 'model method not implemented')
        end
      end
    end
  end
end
