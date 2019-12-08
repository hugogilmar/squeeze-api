# frozen_string_literal: true

module Squeeze
  module V1
    module Categories
      # Delete categories command
      class DeleteCommand < Base::Nested::DeleteCommand
        # Model scope
        def model_scope
          :categories
        end

        # Parent scope
        def parent_scope
          :budgets
        end
      end
    end
  end
end
