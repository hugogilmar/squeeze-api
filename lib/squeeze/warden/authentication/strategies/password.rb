# frozen_string_literal: true

require('bcrypt')
require('json')
require('warden')

module Squeeze
  module Warden
    module Authentication
      module Strategies
        # Warden password authentication strategy
        class Password < ::Warden::Strategies::Base
          # Validate strategy required data
          def valid?
            email.present? && password.present?
          end

          # Authenticate user
          def authenticate!
            return success!(_user) if _user && valid_password?

            fail!('Could not authenticate')
          end

          private

          # Valid password check
          def valid_password?
            BCrypt::Password.new(_user.password_digest) == password
          end

          # Parsed params from request body
          def parsed_params
            @parsed_params ||= JSON.parse(request.body.read)
          end

          # Email from parsed params
          def email
            @email ||= parsed_params['data']['email']
          end

          # Password from parsed params
          def password
            @password ||= parsed_params['data']['password']
          end

          # User builder by database email existance
          def _user
            @_user ||= Squeeze::User.find_by(email: email)
          end
        end
      end
    end
  end
end
