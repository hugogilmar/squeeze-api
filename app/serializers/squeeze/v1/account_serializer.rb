# frozen_string_literal: true

module Squeeze
  module V1
    # Accounts serializer
    class AccountSerializer < ApplicationSerializer
      attributes :uuid, :id, :description, :kind, :reference_number, :created_at, :updated_at
    end
  end
end
