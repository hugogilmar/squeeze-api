# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      # Update command base class
      class UpdateCommand < CreateCommand
        context current_user: nil, resource_id: nil
      end
    end
  end
end
