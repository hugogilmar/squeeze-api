# frozen_string_literal: true

module Squeeze
  module V1
    # Users resource
    class UserResource < ApplicationResource
      model_name 'Squeeze::User'
      attributes :email, :password, :password_confirmation

      # Override fetchable fields
      def fetchable_fields
        super - %i[password password_confirmation]
      end
    end
  end
end
