# frozen_string_literal: true

module Squeeze
  module V1
    module Categories
      # Delete categories command
      class DeleteCommand < Budgets::Nested::DeleteCommand
        # Model builder
        def model
          @model ||= parent_model.categories.find(resource_id)
        end
      end
    end
  end
end
