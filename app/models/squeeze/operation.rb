# frozen_string_literal: true

module Squeeze
  # Operations model
  class Operation < ApplicationRecord
    belongs_to :account
    belongs_to :operable, polymorphic: true
  end
end
