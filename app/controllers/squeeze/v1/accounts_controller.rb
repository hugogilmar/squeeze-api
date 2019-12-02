# frozen_string_literal: true

module Squeeze
  module V1
    # Accounts controller
    class AccountsController < ApplicationController
      # Accounts index endpoint
      def index
        result = Accounts::SearchCommand.new(resources_context).call(filter_params)

        render(json: result.value.as_json, status: :ok)
      end

      # Accounts show endpoint
      def show
        result = Accounts::FindCommand.new(resource_context).call

        render(json: result.value.as_json, status: :ok)
      end

      # Accounts create endpoint
      def create
        result = Accounts::CreateCommand.new(resources_context).call(resource_params)

        render(json: result.value.as_json, status: :created)
      end

      # Accounts update endpoint
      def update
        result = Accounts::UpdateCommand.new(resource_context).call(resource_params)

        render(json: result.value.as_json, status: :ok)
      end

      # Accounts delete endpoint
      def destroy
        _result = Accounts::DeleteCommand.new(resource_context).call

        render(nothing: true, status: :no_content)
      end

      private

      # Accounts allowed params
      def resource_params
        params.require(:data).permit(:description, :kind, :reference_number)
      end

      # Accounts allowed filter params
      def filter_params
        params.permit(:page, :per_page)
      end

      # Accounts collection resources context
      def resources_context
        { current_user: current_user }
      end

      # Accounts member resources context
      def resource_context
        resources_context.merge(resource_id: params[:id])
      end
    end
  end
end
