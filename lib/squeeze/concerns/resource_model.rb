# frozen_string_literal: true

module Squeeze
  module Concerns
    # Resource model base module
    module ResourceModel
      extend ActiveSupport::Concern

      included do
        include Discard::Model
        self.discard_column = :deleted_at
      end
    end
  end
end
