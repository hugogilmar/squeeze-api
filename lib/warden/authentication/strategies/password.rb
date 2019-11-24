# frozen_string_literal: true

require('bcrypt')
require('json')
require('warden')

module Warden
  module Authentication
    module Strategies
      # Warden password authentication strategy
      class Password < Warden::Strategies::Base
        def valid?
          email.present? && password.present?
        end

        def authenticate!
          return success!(_user) if _user && valid_password?

          fail!('Could not authenticate')
        end

        private

        def parsed_params
          @parsed_params ||= JSON.parse(request.body.read)
        end

        def email
          @email ||= parsed_params['data']['email']
        end

        def password
          @password ||= parsed_params['data']['password']
        end

        def _user
          @_user ||= Squeeze::User.find_by(email: email)
        end

        def valid_password?
          BCrypt::Password.new(_user.password_digest) == password
        end
      end
    end
  end
end
