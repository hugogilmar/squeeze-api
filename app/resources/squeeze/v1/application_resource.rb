# frozen_string_literal: true

module Squeeze
  module V1
    # Resource base class
    class ApplicationResource < JSONAPI::Resource
      abstract
    end
  end
end
