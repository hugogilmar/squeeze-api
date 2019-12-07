# frozen_string_literal: true

module Squeeze
  module V1
    # Expenses controller
    class ExpensesController < ApplicationController
      # Expenses index endpoint
      def index
        result = Expenses::SearchCommand.new(resources_context).call(filter_params)

        render(json: result.value.as_json, status: :ok)
      end

      # Expenses show endpoint
      def show
        result = Expenses::FindCommand.new(resource_context).call

        render(json: result.value.as_json, status: :ok)
      end

      # Expenses create endpoint
      def create
        result = Expenses::CreateCommand.new(resources_context).call(resource_params)

        render(json: result.value.as_json, status: :created)
      end

      # Expenses update endpoint
      def update
        result = Expenses::UpdateCommand.new(resource_context).call(resource_params)

        render(json: result.value.as_json, status: :ok)
      end

      # Expenses delete endpoint
      def destroy
        _result = Expenses::DeleteCommand.new(resource_context).call

        render(nothing: true, status: :no_content)
      end

      private

      # Expenses allowed params
      def resource_params
        params.require(:data).permit(:category_id, :account_id, :description, :amount)
      end

      # Expenses allowed filter params
      def filter_params
        params.permit(:page, :per_page)
      end

      # Expenses collection resources context
      def resources_context
        { current_user: current_user, parent_resource_id: params[:budget_id] }
      end

      # Expenses member resources context
      def resource_context
        resources_context.merge(resource_id: params[:id])
      end
    end
  end
end
