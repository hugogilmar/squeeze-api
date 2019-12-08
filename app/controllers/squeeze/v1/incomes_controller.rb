# frozen_string_literal: true

module Squeeze
  module V1
    # Incomes controller
    class IncomesController < ApplicationController
      # Incomes allowed params
      def resource_permitted_params
        %i[category_id account_id description amount]
      end

      # Incomes filter allowed params
      def resource_filter_permitted_params
        %i[page per_page]
      end

      # Incomes collection extra context
      def resources_extra_context
        { parent_resource_id: params[:budget_id] }
      end
    end
  end
end
