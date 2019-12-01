# frozen_string_literal: true

module Squeeze
  module V1
    module Accounts
      # Delete accounts command
      class DeleteCommand < Base::DeleteCommand
        private

        # Model builder
        def model
          @model ||= current_user.accounts.find(resource_id)
        end
      end
    end
  end
end
