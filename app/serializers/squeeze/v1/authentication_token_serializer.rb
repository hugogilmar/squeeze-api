# frozen_string_literal: true

module Squeeze
  module V1
    # Authentication token serializer
    class AuthenticationTokenSerializer < ActiveModel::Serializer
      type :data
      attributes :authentication_token, :expires_at
    end
  end
end
