# frozen_string_literal: true

require('jwt')
require('ostruct')

module Squeeze
  module V1
    module Authentications
      # Command base class
      class CreateCommand < ApplicationCommand
        context :warden

        # Command execution
        def call
          warden.authenticate(:password)
          return failure(:unauthorized) unless warden.authenticated?

          success(serializer)
        end

        private

        # Model builder
        def model
          @model ||= model_class.new(authentication_token, expires_at)
        end

        # Serializer builder
        def serializer
          @serializer ||= ActiveModelSerializers::SerializableResource.new(model, serializer: serializer_class)
        end

        # Model class used for model builder
        def model_class
          AuthenticationToken
        end

        # Serializer class used for json serialization
        def serializer_class
          AuthenticationTokenSerializer
        end

        # Token expiration timestamp
        def expires_at
          @expires_at ||= (Time.zone.now + 24.hours)
        end

        # Token issued timestamp
        def issued_at
          @issued_at ||= Time.zone.now
        end

        # Token payload
        def payload
          @payload ||= { email: warden.user.email, exp: expires_at.to_i, iat: issued_at.to_i }
        end

        # Authentication token generation by payload
        def authentication_token
          @authentication_token ||= JWT.encode(payload, secret, algorithm)
        end

        # Token encode secret
        def secret
          @secret ||= Rails.application.secrets.secret_key_base.to_s
        end

        # Token encode algorithm
        def algorithm
          'HS256'
        end
      end
    end
  end
end
