# frozen_string_literal: true

require('jwt')

module Squeeze
  module V1
    module Authentications
      # Command base class
      class CreateCommand < ApplicationCommand
        context :warden

        def call
          warden.authenticate(:password)
          return failure(:unauthorized) unless warden.authenticated?
          success(authentication_token: authentication_token, expires_at: expires_at)
        end

        private

        def expires_at
          @expiration ||= (Time.now + 24.hours)
        end

        def issued_at
          @issued_at ||= Time.now
        end

        def payload
          @payload ||= { email: warden.user.email, exp: expires_at.to_i, iat: issued_at.to_i }
        end

        def authentication_token
          @authentication_token ||= JWT.encode(payload, secret, algorithm)
        end

        def secret
          @secret ||= Rails.application.secrets.secret_key_base.to_s
        end

        def algorithm
          'HS256'
        end
      end
    end
  end
end
