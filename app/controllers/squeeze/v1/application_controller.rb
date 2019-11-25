# frozen_string_literal: true

module Squeeze
  module V1
    # Controller base class
    class ApplicationController < ActionController::API
      include Warden::Authentication::HelperMethods

      before_action :authenticate_user!

      rescue_from ActionController::ParameterMissing do |e|
        render json: { error: e.message.capitalize }, status: 400
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message.capitalize, detail: e.record.errors }, status: 422
      end

      # rescue_from ActionController::RoutingError do |e|
      #   render json: { error: e.message.capitalize }, status: 404
      # end

      # rescue_from AbstractController::ActionNotFound do |e|
      #   render json: { error: e.message.capitalize }, status: 404
      # end

      # rescue_from ActiveRecord::RecordNotFound do |e|
      #   render json: { error: e.message.capitalize }, status: 404
      # end
    end
  end
end
