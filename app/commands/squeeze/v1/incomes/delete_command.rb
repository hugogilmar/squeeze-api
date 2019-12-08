# frozen_string_literal: true

module Squeeze
  module V1
    module Incomes
      # Delete incomes command
      class DeleteCommand < Base::Nested::DeleteCommand
        # Model scope
        def model_scope
          :incomes
        end

        # Parent scope
        def parent_scope
          :budgets
        end
      end
    end
  end
end
