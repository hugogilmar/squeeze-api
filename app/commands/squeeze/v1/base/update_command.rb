# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      # Update command base class
      class UpdateCommand < CreateCommand
        context current_user: nil, resource_id: nil

        # Model builder
        def model
          @model ||= current_user.__send__(model_scope).find(resource_id)
        end
      end
    end
  end
end
