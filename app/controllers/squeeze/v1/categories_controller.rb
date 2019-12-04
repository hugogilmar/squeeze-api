# frozen_string_literal: true

module Squeeze
  module V1
    # Categories controller
    class CategoriesController < ApplicationController
      # Categories index endpoint
      def index
        result = Categories::SearchCommand.new(resources_context).call(filter_params)

        render(json: result.value.as_json, status: :ok)
      end

      # Categories show endpoint
      def show
        result = Categories::FindCommand.new(resource_context).call

        render(json: result.value.as_json, status: :ok)
      end

      # Categories create endpoint
      def create
        result = Categories::CreateCommand.new(resources_context).call(resource_params)

        render(json: result.value.as_json, status: :created)
      end

      # Categories update endpoint
      def update
        result = Categories::UpdateCommand.new(resource_context).call(resource_params)

        render(json: result.value.as_json, status: :ok)
      end

      # Categories delete endpoint
      def destroy
        _result = Categories::DeleteCommand.new(resource_context).call

        render(nothing: true, status: :no_content)
      end

      private

      # Categories allowed params
      def resource_params
        params.require(:data).permit(:description, :amount)
      end

      # Categories allowed filter params
      def filter_params
        params.permit(:page, :per_page)
      end

      # Categories collection resources context
      def resources_context
        { current_user: current_user, parent_resource_id: params[:budget_id] }
      end

      # Categories member resources context
      def resource_context
        resources_context.merge(resource_id: params[:id])
      end
    end
  end
end
