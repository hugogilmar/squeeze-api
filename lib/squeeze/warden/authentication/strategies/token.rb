# frozen_string_literal: true

require('jwt')
require('warden')

module Squeeze
  module Warden
    module Authentication
      module Strategies
        # Warden JTW token authentication strategy
        class Token < ::Warden::Strategies::Base
          BEARER_PATTERN = /^Bearer /

          # Validate strategy required data
          def valid?
            authorization_header.present? && authorization_header.match(BEARER_PATTERN) && authentication_token.present?
          end

          # Authenticate user
          def authenticate!
            return success!(_user) if valid_token? && _user

            fail!('Could not authenticate')
          end

          private

          # Valid token check
          def valid_token?
            token && Time.zone.at(token[:exp]) > Time.zone.now
          end

          # Authorization header from environment variables
          def authorization_header
            @authorization_header ||= env['HTTP_AUTHORIZATION']
          end

          # Authentication token from authorization header
          def authentication_token
            @authentication_token ||= authorization_header.gsub(BEARER_PATTERN, '')
          end

          # Decoded token from authentication token
          def token
            @token ||= HashWithIndifferentAccess.new(
              JWT.decode(authentication_token, secret, true, decode_options).first
            )
          rescue JWT::DecodeError, JWT::ExpiredSignature, JWT::InvalidIatError
            nil
          end

          # User builder by decoded token data
          def _user
            @_user ||= Squeeze::User.kept.find_by(email: token[:email])
          end

          # Token decode option
          def decode_options
            { algorithm: algorithm, verify_iat: true }
          end

          # Token decode secret
          def secret
            @secret ||= Rails.application.secrets.secret_key_base.to_s
          end

          # Token decode algorithm
          def algorithm
            @algorithm ||= 'HS256'
          end
        end
      end
    end
  end
end
