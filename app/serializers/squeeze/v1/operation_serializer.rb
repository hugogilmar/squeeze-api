# frozen_string_literal: true

module Squeeze
  module V1
    # Operations serializer
    class OperationSerializer < ApplicationSerializer
      attributes :id, :amount, :created_at, :updated_at
      has_one :operable

      # Override serializer seek for polymorphic association
      def self.serializer_for(model, _options)
        case model.class.name
        when 'Squeeze::Income'
          IncomeSerializer
        when 'Squeeze::Expense'
          ExpenseSerializer
        else
          super
        end
      end
    end
  end
end
