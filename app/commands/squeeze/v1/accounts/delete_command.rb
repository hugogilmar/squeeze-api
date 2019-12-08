# frozen_string_literal: true

module Squeeze
  module V1
    module Accounts
      # Delete accounts command
      class DeleteCommand < Base::DeleteCommand
        # Model scope
        def model_scope
          :accounts
        end
      end
    end
  end
end
