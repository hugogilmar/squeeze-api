# frozen_string_literal: true

module Squeeze
  module V1
    # Incomes controller
    class IncomesController < ApplicationController
      # Incomes index endpoint
      def index
        result = Incomes::SearchCommand.new(resources_context).call(filter_params)

        render(json: result.value.as_json, status: :ok)
      end

      # Incomes show endpoint
      def show
        result = Incomes::FindCommand.new(resource_context).call

        render(json: result.value.as_json, status: :ok)
      end

      # Incomes create endpoint
      def create
        result = Incomes::CreateCommand.new(resources_context).call(resource_params)

        render(json: result.value.as_json, status: :created)
      end

      # Incomes update endpoint
      def update
        result = Incomes::UpdateCommand.new(resource_context).call(resource_params)

        render(json: result.value.as_json, status: :ok)
      end

      # Incomes delete endpoint
      def destroy
        _result = Incomes::DeleteCommand.new(resource_context).call

        render(nothing: true, status: :no_content)
      end

      private

      # Incomes allowed params
      def resource_params
        params.require(:data).permit(:category_id, :account_id, :description, :amount)
      end

      # Incomes allowed filter params
      def filter_params
        params.permit(:page, :per_page)
      end

      # Incomes collection resources context
      def resources_context
        { current_user: current_user, parent_resource_id: params[:budget_id] }
      end

      # Incomes member resources context
      def resource_context
        resources_context.merge(resource_id: params[:id])
      end
    end
  end
end
