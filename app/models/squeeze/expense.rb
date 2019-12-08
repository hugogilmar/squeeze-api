# frozen_string_literal: true

module Squeeze
  # Expenses model
  class Expense < ApplicationRecord
    belongs_to :budget
    belongs_to :category
    belongs_to :account
    has_one :operation, as: :operable, inverse_of: :operable, dependent: :destroy

    after_save :store_operation!

    # Store expense operation callback
    def store_operation!
      operation_attrs = { account: account, amount: amount.abs * -1 }
      operation.nil? ? create_operation(operation_attrs) : operation.update(operation_attrs)
    end
  end
end
