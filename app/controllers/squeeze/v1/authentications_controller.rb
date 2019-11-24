# frozen_string_literal: true

module Squeeze
  module V1
    # Authentications controller
    class AuthenticationsController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[create]

      # Authentications create endpoint
      def create
        command = Authentications::CreateCommand.new(warden: warden).call

        unauthorize! unless command.success?

        render(json: command.value, status: :created)
      end

      private

      # Authentications allowed params
      def authentication_params
        params.require(:data).permit(:email, :password)
      end
    end
  end
end
