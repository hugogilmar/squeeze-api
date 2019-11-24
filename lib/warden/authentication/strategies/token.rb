# frozen_string_literal: true

require('jwt')
require('warden')

module Warden
  module Authentication
    module Strategies
      # Warden JTW token authentication strategy
      class Token < Warden::Strategies::Base
        def valid?
          authentication_token.present?
        end

        def authenticate!
          return success!(_user) if valid_token? && _user

          fail!('Could not authenticate')
        end

        private

        def valid_token?
          token && Time.at(token[:exp]) > Time.now
        end

        def authentication_token
          @authentication_token ||= env['HTTP_AUTHORIZATION']
        end

        def token
          @token ||= HashWithIndifferentAccess.new(JWT.decode(authentication_token, secret, true, decode_options).first)
        rescue JWT::DecodeError, JWT::ExpiredSignature, JWT::InvalidIatError => e
          nil
        end

        def decode_options
          { algorithm: algorithm, verify_iat: true }
        end

        def _user
          @_user ||= Squeeze::User.find_by(email: token[:email])
        end

        def secret
          @secret ||= Rails.application.secrets.secret_key_base.to_s
        end

        def algorithm
          @algorithm ||= 'HS256'
        end
      end
    end
  end
end
