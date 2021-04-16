# frozen_string_literal: true

module Squeeze
  module V1
    # Expenses controller
    class ExpensesController < ApplicationController
      # Expenses allowed params
      def resource_permitted_params
        %i[category_id account_id description amount scheduled_for]
      end

      # Expenses filter allowed params
      def resource_filter_permitted_params
        %i[page per_page]
      end

      # Expenses collection extra context
      def resources_extra_context
        { parent_resource_id: params[:budget_id] }
      end
    end
  end
end
