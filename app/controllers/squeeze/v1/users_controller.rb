# frozen_string_literal: true

module Squeeze
  module V1
    # Users controller
    class UsersController < ApplicationController
      # Users create endpoint
      def create
        command = Users::CreateCommand.new.call(user_params)

        raise(ActiveRecord::RecordInvalid, command.error) unless command.success?

        render(json: command.value, status: :created)
      end

      private

      # Users allowed params
      def user_params
        params.require(:data).permit(:email, :password, :password_confirmation, profile: %i[first_name last_name])
      end
    end
  end
end
