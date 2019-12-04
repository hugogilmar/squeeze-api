# frozen_string_literal: true

module Squeeze
  module V1
    module Categories
      # Update categories command
      class UpdateCommand < Base::Nested::UpdateCommand
        private

        # Model builder
        def model
          @model ||= parent_model.categories.find(resource_id)
        end

        # Parent model builder
        def parent_model
          @parent_model ||= current_user.budgets.find(parent_resource_id)
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
