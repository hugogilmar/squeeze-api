# frozen_string_literal: true

module Squeeze
  module V1
    # Categories serializer
    class CategorySerializer < ApplicationSerializer
      attributes :id, :description, :amount, :created_at, :updated_at
    end
  end
end
