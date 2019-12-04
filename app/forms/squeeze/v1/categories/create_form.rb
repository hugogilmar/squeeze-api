# frozen_string_literal: true

module Squeeze
  module V1
    module Categories
      # Categories create form
      class CreateForm < Reform::Form
        property :description
        property :amount

        validates :description, presence: true
        validates :amount, presence: true
      end
    end
  end
end
