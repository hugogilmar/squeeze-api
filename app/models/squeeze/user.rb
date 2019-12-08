# frozen_string_literal: true

module Squeeze
  # Users model
  class User < ApplicationRecord
    has_secure_password

    has_one :profile, dependent: :destroy
    has_many :accounts, dependent: :destroy
    has_many :budgets, dependent: :destroy
    has_many :categories, through: :budgets
    has_many :incomes, through: :budgets
    has_many :expenses, through: :budgets
    has_many :incomes, through: :budgets
    has_many :operations, through: :accounts

    accepts_nested_attributes_for :profile
  end
end
