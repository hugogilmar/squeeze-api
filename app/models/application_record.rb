# frozen_string_literal: true

# Record base class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  before_save :ensure_uuid

  def ensure_uuid
    self.uuid = UUID.new.generate unless uuid.present?
  end
end
