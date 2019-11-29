# frozen_string_literal: true

module Squeeze
  # Accounts model
  class Account < ApplicationRecord
    belongs_to :user
  end
end
