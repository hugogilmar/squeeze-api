# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      module Nested
        # Search nested command base class
        class SearchCommand < Base::SearchCommand
          context current_user: nil, parent_resource_id: nil

          private

          # Model builder
          def models
            @models ||= parent_model.__send__(models_scope).page(page).per(per_page)
          end

          # Parent model builder
          def parent_model
            @parent_model ||= current_user.__send__(parent_scope).find(parent_resource_id)
          end

          # Parent scope
          def parent_scope
            raise(NotImplementedError, 'parent_scope method not implemented')
          end
        end
      end
    end
  end
end
