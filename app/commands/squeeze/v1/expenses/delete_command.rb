# frozen_string_literal: true

module Squeeze
  module V1
    module Expenses
      # Delete expenses command
      class DeleteCommand < Base::Nested::DeleteCommand
        # Model scope
        def model_scope
          :expenses
        end

        # Parent scope
        def parent_scope
          :budgets
        end
      end
    end
  end
end
