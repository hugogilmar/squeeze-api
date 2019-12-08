# frozen_string_literal: true

module Squeeze
  module Concerns
    # Resource model base module
    module ResourceModel
      extend ActiveSupport::Concern

      included do
        before_save :ensure_uuid
      end

      # Ensure model's uuid attribute is present
      def ensure_uuid
        self.uuid = UUID.new.generate if uuid.blank?
      end
    end
  end
end
