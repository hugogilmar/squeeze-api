# frozen_string_literal: true

module Squeeze
  module V1
    module Budgets
      # Budgets create form
      class CreateForm < Reform::Form
        property :description

        validates :description, presence: true
      end
    end
  end
end
