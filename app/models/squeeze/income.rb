# frozen_string_literal: true

module Squeeze
  # Incomes model
  class Income < ApplicationRecord
    belongs_to :budget
    belongs_to :category
    belongs_to :account
    has_one :operation, as: :operable, inverse_of: :operable, dependent: :destroy

    after_save :store_operation!
    after_discard do
      operation.discard
    end

    # Store income operation callback
    def store_operation!
      operation_attrs = { account: account, amount: amount.abs }
      operation.nil? ? create_operation(operation_attrs) : operation.update(operation_attrs)
    end
  end
end
