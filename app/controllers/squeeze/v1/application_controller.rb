# frozen_string_literal: true

module Squeeze
  module V1
    # Controller base class
    class ApplicationController < ActionController::API
      include Warden::Authentication::HelperMethods
      include Concerns::ResourceController

      before_action :authenticate_user!

      rescue_from ActionController::ParameterMissing do |e|
        render json: { error: e.message.capitalize }, status: 400
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message.capitalize, detail: e.record.errors }, status: 422
      end

      rescue_from ActiveRecord::RecordNotDestroyed, Discard::RecordNotDiscarded do |e|
        render json: { error: e.message.capitalize, detail: e.record.errors }, status: 422
      end

      rescue_from ActiveRecord::RecordNotFound do |_e|
        render json: { error: 'Could not find resource with provided id' }, status: 404
      end
    end
  end
end
