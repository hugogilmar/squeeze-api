# frozen_string_literal: true

module Squeeze
  module V1
    # Categories controller
    class CategoriesController < ApplicationController
      # Categories allowed params
      def resource_permitted_params
        %i[description amount]
      end

      # Categories filter allowed params
      def resource_filter_permitted_params
        %i[page per_page]
      end

      # Categories collection extra context
      def resources_extra_context
        { parent_resource_id: params[:budget_id] }
      end
    end
  end
end
