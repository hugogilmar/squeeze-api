# frozen_string_literal: true

module Squeeze
  # Record base class
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    before_save :ensure_uuid

    # Ensure model's uuid attribute is present
    def ensure_uuid
      self.uuid = UUID.new.generate if uuid.blank?
    end

    class << self
      # Set table prefix for inherited models
      def table_name_prefix
        'squeeze_'
      end
    end
  end
end
