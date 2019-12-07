# frozen_string_literal: true

module Squeeze
  module V1
    # Incomes serializer
    class IncomeSerializer < ApplicationSerializer
      attributes :uuid, :id, :description, :amount, :created_at, :updated_at
      has_one :category, serializer: CategorySerializer
      has_one :account, serializer: AccountSerializer
    end
  end
end
