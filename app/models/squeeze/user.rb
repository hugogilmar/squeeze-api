# frozen_string_literal: true

module Squeeze
  # Users model
  class User < ApplicationRecord
    has_secure_password

    has_one :profile, dependent: :destroy
    has_many :accounts, dependent: :destroy
    has_many :budgets, dependent: :destroy
    has_many :categories, through: :budgets

    accepts_nested_attributes_for :profile
  end
end
