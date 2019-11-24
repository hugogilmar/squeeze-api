# frozen_string_literal: true

module Warden
  module Authentication
    module HelperMethods
      def warden
        request.env['warden']
      end

      def authenticated_user?
        warden.authenticated?
      end

      def current_user
        warden.user
      end

      def unauthorize!
        throw(:warden)
      end

      def authenticate_user!
        warden.authenticate(:token)
        unauthorize! unless authenticated_user?
      end
    end
  end
end
