# frozen_string_literal: true

module Warden
  module Authentication
    # Warden authentication helper methods
    module HelperMethods
      # Warden instance from environment variable
      def warden
        request.env['warden']
      end

      # Warden authenticated user check
      def authenticated_user?
        warden.authenticated?
      end

      # Warden authenticated user instance
      def current_user
        warden.user
      end

      # Warden failure app trigger
      def unauthorize!
        throw(:warden)
      end

      # Warden authentication trigger
      def authenticate_user!
        warden.authenticate(:token)
        unauthorize! unless authenticated_user?
      end
    end
  end
end
