# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      module Nested
        # Member nested command base class
        class MemberCommand < Base::MemberCommand
          context current_user: nil, parent_resource_id: nil, resource_id: nil

          private

          # Model builder
          def model
            @model ||= parent_model.__send__(model_scope).kept.find(resource_id)
          end

          # Parent model builder
          def parent_model
            @parent_model ||= current_user.__send__(parent_scope).kept.find(parent_resource_id)
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
