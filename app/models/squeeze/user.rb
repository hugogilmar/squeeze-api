# frozen_string_literal: true

module Squeeze
  # Users model
  class User < ApplicationRecord
    has_secure_password

    has_one :profile, dependent: :destroy
    has_many :accounts, dependent: :destroy

    accepts_nested_attributes_for :profile
  end
end
