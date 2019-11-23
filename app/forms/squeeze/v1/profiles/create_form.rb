# frozen_string_literal: true

module Squeeze
  module V1
    module Profiles
      class CreateForm < Reform::Form
        property :first_name
        property :last_name

        validates :first_name, presence: true
        validates :last_name, presence: true
      end
    end
  end
end
