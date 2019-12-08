# frozen_string_literal: true

module Squeeze
  module V1
    # Operations controller
    class OperationsController < ApplicationController
      # Operations filter allowed params
      def resource_filter_permitted_params
        %i[page per_page]
      end

      # Operations collection extra context
      def resources_extra_context
        { parent_resource_id: params[:account_id] }
      end
    end
  end
end
