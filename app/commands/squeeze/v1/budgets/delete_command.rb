# frozen_string_literal: true

module Squeeze
  module V1
    module Budgets
      # Delete budgets command
      class DeleteCommand < Base::DeleteCommand
        # Model scope
        def model_scope
          :budgets
        end
      end
    end
  end
end
