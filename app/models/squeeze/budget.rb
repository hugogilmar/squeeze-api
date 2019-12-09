# frozen_string_literal: true

module Squeeze
  # Budgets model
  class Budget < ApplicationRecord
    belongs_to :user
    has_many :categories, dependent: :destroy
    has_many :incomes, dependent: :destroy
    has_many :expenses, dependent: :destroy

    after_discard do
      categories.discard_all
      incomes.discard_all
      expenses.discard_all
    end
  end
end
