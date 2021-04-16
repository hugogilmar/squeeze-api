# frozen_string_literal: true

module Squeeze
  module V1
    # Profiles serializer
    class ProfileSerializer < ApplicationSerializer
      attributes :id, :first_name, :last_name, :created_at, :updated_at
    end
  end
end
