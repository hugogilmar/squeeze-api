# frozen_string_literal: true

module Squeeze
  module V1
    # Budgets controller
    class BudgetsController < ApplicationController
      # Accounts allowed params
      def resource_permitted_params
        %i[description]
      end

      # Accounts filter allowed params
      def resource_filter_permitted_params
        %i[page per_page]
      end
    end
  end
end
