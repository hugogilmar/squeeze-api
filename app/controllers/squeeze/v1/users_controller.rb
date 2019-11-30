# frozen_string_literal: true

module Squeeze
  module V1
    # Users controller
    class UsersController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[create]

      # Users create endpoint
      def create
        result = Users::CreateCommand.new.call(create_user_params)

        raise(ActiveRecord::RecordInvalid, result.error) unless result.success?

        render(json: result.value.as_json, status: :created)
      end

      # Users profile update endpoint
      def update
        result = Users::UpdateCommand.new(current_user: current_user).call(update_user_params)

        raise(ActiveRecord::RecordInvalid, result.error) unless result.success?

        render(json: result.value.as_json, status: :created)
      end

      private

      # Users create allowed params
      def create_user_params
        params.require(:data).permit(:email, :password, :password_confirmation, profile: %i[first_name last_name])
      end

      # Users update allowed params
      def update_user_params
        params.require(:data).permit(profile: %i[first_name last_name])
      end
    end
  end
end
