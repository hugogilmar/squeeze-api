# frozen_string_literal: true

module Squeeze
  module V1
    # Controller base class
    class ApplicationController < JSONAPI::ResourceController
      skip_forgery_protection
    end
  end
end
