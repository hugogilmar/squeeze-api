module Squeeze
  module V1
    class UserResource < ApplicationResource
      model_name 'Squeeze::User'
      attributes :email, :password, :password_confirmation

      def fetchable_fields
        super - %i[password password_confirmation]
      end
    end
  end
end
