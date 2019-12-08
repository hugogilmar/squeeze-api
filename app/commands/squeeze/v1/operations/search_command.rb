# frozen_string_literal: true

module Squeeze
  module V1
    module Operations
      # Search operations command
      class SearchCommand < Base::Nested::SearchCommand
        private

        # Models builder
        def models
          @models ||= parent_model.operations.page(page).per(per_page)
        end

        # Parent model builder
        def parent_model
          @parent_model ||= current_user.accounts.find(parent_resource_id)
        end

        # Serializer class used for json serialization
        def serializer_class
          OperationSerializer
        end
      end
    end
  end
end
