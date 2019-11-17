# frozen_string_literal: true

module Squeeze
  # Users model
  class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
  end
end
