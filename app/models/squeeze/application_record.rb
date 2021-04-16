# frozen_string_literal: true

module Squeeze
  # Record base class
  class ApplicationRecord < ActiveRecord::Base
    include Concerns::ResourceModel

    self.abstract_class = true

    # Set table prefix for inherited models
    def self.table_name_prefix
      'squeeze_'
    end
  end
end
