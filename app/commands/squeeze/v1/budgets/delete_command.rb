# frozen_string_literal: true

module Squeeze
  module V1
    module Budgets
      # Delete budgets command
      class DeleteCommand < Base::DeleteCommand
        # Model builder
        def model
          @model ||= current_user.budgets.find(resource_id)
        end
      end
    end
  end
end
