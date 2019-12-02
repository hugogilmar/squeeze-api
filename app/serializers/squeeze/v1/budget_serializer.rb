# frozen_string_literal: true

module Squeeze
  module V1
    # Budgets serializer
    class BudgetSerializer < ApplicationSerializer
      attributes :uuid, :id, :description, :created_at, :updated_at
    end
  end
end
