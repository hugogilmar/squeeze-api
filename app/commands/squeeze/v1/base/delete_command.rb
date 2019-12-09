# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      # Delete command base class
      class DeleteCommand < MemberCommand
        # Command execution
        def call
          model.discard!

          success(model)
        end
      end
    end
  end
end
