# frozen_string_literal: true

module Squeeze
  module V1
    # Accounts controller
    class AccountsController < ApplicationController
      # Accounts allowed params
      def resource_permitted_params
        %i[description kind reference_number]
      end

      # Accounts filter allowed params
      def resource_filter_permitted_params
        %i[page per_page]
      end

      # Accounts collection extra context
      def resources_extra_context
        { parent_resource_id: params[:budget_id] }
      end
    end
  end
end
