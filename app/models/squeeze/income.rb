# frozen_string_literal: true

module Squeeze
  # Incomes model
  class Income < ApplicationRecord
    belongs_to :budget
    belongs_to :category
    belongs_to :account
  end
end
