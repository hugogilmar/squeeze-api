# frozen_string_literal: true

module Squeeze
  module V1
    module Categories
      # Update categories command
      class UpdateCommand < Budgets::Nested::UpdateCommand
        # Model builder
        def model
          @model ||= parent_model.categories.find(resource_id)
        end

        # Form class used for params validation
        def form_class
          UpdateForm
        end

        # Serializer class used for json serialization
        def serializer_class
          CategorySerializer
        end
      end
    end
  end
end
