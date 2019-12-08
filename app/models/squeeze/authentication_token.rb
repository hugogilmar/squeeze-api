# frozen_string_literal: true

module Squeeze
  # Authentication token model
  class AuthenticationToken
    include ActiveModel::Serializers::JSON

    attr_reader :authentication_token, :expires_at

    # Initialize object with required attributes
    def initialize(authentication_token, expires_at)
      @authentication_token = authentication_token
      @expires_at = expires_at
    end
  end
end
