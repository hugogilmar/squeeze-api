# frozen_string_literal: true

module Squeeze
  module V1
    # Operations controller
    class OperationsController < ApplicationController
      # Operations index endpoint
      def index
        result = Operations::SearchCommand.new(resources_context).call(filter_params)

        render(json: result.value.as_json, status: :ok)
      end

      private

      # Operations allowed filter params
      def filter_params
        params.permit(:page, :per_page)
      end

      # Operations collection resources context
      def resources_context
        { current_user: current_user, parent_resource_id: params[:account_id] }
      end
    end
  end
end
