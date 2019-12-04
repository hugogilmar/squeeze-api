# frozen_string_literal: true

module Squeeze
  # Categories model
  class Category < ApplicationRecord
    belongs_to :budget
  end
end
