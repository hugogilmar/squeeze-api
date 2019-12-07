# frozen_string_literal: true

module Squeeze
  # Expenses model
  class Expense < ApplicationRecord
    belongs_to :budget
    belongs_to :category
    belongs_to :account
  end
end
