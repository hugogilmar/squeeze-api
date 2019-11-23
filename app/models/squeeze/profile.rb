# frozen_string_literal: true

module Squeeze
  # Profiles model
  class Profile < ApplicationRecord
    belongs_to :user
  end
end
