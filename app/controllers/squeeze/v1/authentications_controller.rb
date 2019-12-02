# frozen_string_literal: true

module Squeeze
  module V1
    # Authentications controller
    class AuthenticationsController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[create]

      # Authentications create endpoint
      def create
        result = Authentications::CreateCommand.new(warden: warden).call

        render(json: result.value.as_json, status: :created)
      end
    end
  end
end
