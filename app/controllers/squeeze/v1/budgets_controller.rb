# frozen_string_literal: true

module Squeeze
  module V1
    # Budgets controller
    class BudgetsController < ApplicationController
      # Budgets index endpoint
      def index
        result = Budgets::SearchCommand.new(current_user: current_user).call(search_params)

        raise(ActiveRecord::RecordInvalid, result.error) unless result.success?

        render(json: result.value.as_json, status: :ok)
      end

      # Budgets show endpoint
      def show
        result = Budgets::FindCommand.new(current_user: current_user, resource_id: params[:id]).call

        raise(ActiveRecord::RecordInvalid, result.error) unless result.success?

        render(json: result.value.as_json, status: :ok)
      end

      # Budgets create endpoint
      def create
        result = Budgets::CreateCommand.new(current_user: current_user).call(budget_params)

        raise(ActiveRecord::RecordInvalid, result.error) unless result.success?

        render(json: result.value.as_json, status: :created)
      end

      # Budgets update endpoint
      def update
        result = Budgets::UpdateCommand.new(current_user: current_user, resource_id: params[:id]).call(budget_params)

        raise(ActiveRecord::RecordInvalid, result.error) unless result.success?

        render(json: result.value.as_json, status: :ok)
      end

      # Budgets delete endpoint
      def destroy
        result = Budgets::DeleteCommand.new(current_user: current_user, resource_id: params[:id]).call

        raise(ActiveRecord::RecordInvalid, result.error) unless result.success?

        render(nothing: true, status: :no_content)
      end

      private

      # Budgets allowed params
      def budget_params
        params.require(:data).permit(:description)
      end

      def search_params
        params.permit(:page, :per_page)
      end
    end
  end
end
