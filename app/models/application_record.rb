# frozen_string_literal: true

# Record base class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  before_save :ensure_uuid

  # Ensure model's uuid attribute is present
  def ensure_uuid
    self.uuid = UUID.new.generate unless uuid.present?
  end
end
