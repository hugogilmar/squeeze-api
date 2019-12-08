# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      # Create command base class
      class CreateCommand < PersistCommand
        private

        # Model builder
        def model
          @model ||= current_user.__send__(model_scope).new
        end
      end
    end
  end
end
