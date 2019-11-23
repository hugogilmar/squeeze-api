# frozen_string_literal: true

module Squeeze
  class Profile < ApplicationRecord
    belongs_to :user
  end
end
