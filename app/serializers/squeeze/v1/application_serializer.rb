# frozen_string_literal: true

module Squeeze
  module V1
    # Serializer base class
    class ApplicationSerializer < ActiveModel::Serializer
      type :data
    end
  end
end
