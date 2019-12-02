# frozen_string_literal: true

module Squeeze
  # Budgets model
  class Budget < ApplicationRecord
    belongs_to :user
  end
end
