# frozen_string_literal: true

module Squeeze
  module V1
    module Expenses
      # Expenses create form
      class CreateForm < Reform::Form
        property :category_id
        property :account_id
        property :description
        property :amount

        validates :category_id, presence: true
        validates :account_id, presence: true
        validates :description, presence: true
        validates :amount, presence: true
      end
    end
  end
end
