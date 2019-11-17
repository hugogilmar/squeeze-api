# frozen_string_literal: true

module Squeeze
  module V1
    # Controller base class
    class ApplicationController < ActionController::API
      include JSONAPI::ActsAsResourceController
      skip_forgery_protection
    end
  end
end
