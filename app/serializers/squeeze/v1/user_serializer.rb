# frozen_string_literal: true

module Squeeze
  module V1
    # Users serializer
    class UserSerializer < ActiveModel::Serializer
      type :data
      attributes :uuid, :id, :email, :created_at, :updated_at
      has_one :profile
    end
  end
end
