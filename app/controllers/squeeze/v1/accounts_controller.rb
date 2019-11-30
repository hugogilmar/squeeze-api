# frozen_string_literal: true

module Squeeze
  module V1
    # Accounts controller
    class AccountsController < ApplicationController
      # Accounts show endpoint
      def index
        result = Accounts::SearchCommand.new(current_user: current_user).call(search_params)

        raise(ActiveRecord::RecordInvalid, result.error) unless result.success?

        render(json: result.value.as_json, status: :ok)
      end

      # Accounts show endpoint
      def show
        result = Accounts::FindCommand.new(current_user: current_user, resource_id: params[:id]).call

        raise(ActiveRecord::RecordInvalid, result.error) unless result.success?

        render(json: result.value.as_json, status: :ok)
      end

      # Accounts create endpoint
      def create
        result = Accounts::CreateCommand.new(current_user: current_user).call(account_params)

        raise(ActiveRecord::RecordInvalid, result.error) unless result.success?

        render(json: result.value.as_json, status: :created)
      end

      # Accounts update endpoint
      def update
        result = Accounts::UpdateCommand.new(current_user: current_user, resource_id: params[:id]).call(account_params)

        raise(ActiveRecord::RecordInvalid, result.error) unless result.success?

        render(json: result.value.as_json, status: :ok)
      end

      # Accounts delete endpoint
      def destroy
        result = Accounts::DeleteCommand.new(current_user: current_user, resource_id: params[:id]).call

        raise(ActiveRecord::RecordInvalid, result.error) unless result.success?

        render nothing: true, status: :no_content
      end

      private

      # Accounts allowed params
      def account_params
        params.require(:data).permit(:description, :kind, :reference_number)
      end

      def search_params
        params.permit(:page, :per_page)
      end
    end
  end
end
