# frozen_string_literal: true

module Squeeze
  module V1
    module Accounts
      # Accounts create form
      class CreateForm < Reform::Form
        property :description
        property :kind
        property :reference_number

        validates :description, presence: true
        validates :kind, presence: true
        validates :reference_number, presence: true
      end
    end
  end
end
