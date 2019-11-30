# frozen_string_literal: true

module Squeeze
  module V1
    module Accounts
      # Search accounts command
      class SearchCommand < Base::SearchCommand
        private

        # Models builder
        def models
          @models ||= current_user.accounts.page(page).per(per_page)
        end

        # Serializer class used for json serialization
        def serializer_class
          AccountSerializer
        end
      end
    end
  end
end
