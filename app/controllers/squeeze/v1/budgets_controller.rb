# frozen_string_literal: true

module Squeeze
  module V1
    # Budgets controller
    class BudgetsController < ApplicationController
      # Budgets index endpoint
      def index
        result = Budgets::SearchCommand.new(resources_context).call(filter_params)

        render(json: result.value.as_json, status: :ok)
      end

      # Budgets show endpoint
      def show
        result = Budgets::FindCommand.new(resource_context).call

        render(json: result.value.as_json, status: :ok)
      end

      # Budgets create endpoint
      def create
        result = Budgets::CreateCommand.new(resources_context).call(resource_params)

        render(json: result.value.as_json, status: :created)
      end

      # Budgets update endpoint
      def update
        result = Budgets::UpdateCommand.new(resource_context).call(resource_params)

        render(json: result.value.as_json, status: :ok)
      end

      # Budgets delete endpoint
      def destroy
        _result = Budgets::DeleteCommand.new(resource_context).call

        render(nothing: true, status: :no_content)
      end

      private

      # Budgets allowed params
      def resource_params
        params.require(:data).permit(:description)
      end

      # Budgets allowed filter params
      def filter_params
        params.permit(:page, :per_page)
      end

      # Budgets collection resources context
      def resources_context
        { current_user: current_user }
      end

      # Budgets member resources context
      def resource_context
        resources_context.merge(resource_id: params[:id])
      end
    end
  end
end
