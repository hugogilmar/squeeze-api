# frozen_string_literal: true

module Squeeze
  module V1
    # Users serializer
    class UserSerializer < ApplicationSerializer
      attributes :uuid, :id, :email, :created_at, :updated_at
      has_one :profile, serializer: ProfileSerializer
    end
  end
end
