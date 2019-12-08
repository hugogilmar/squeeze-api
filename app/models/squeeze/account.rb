# frozen_string_literal: true

module Squeeze
  # Accounts model
  class Account < ApplicationRecord
    belongs_to :user
    has_many :operations, dependent: :destroy

    enum kind: %i[bank_account cash credit_card debit_card]
  end
end
