# frozen_string_literal: true

module Squeeze
  # Job base class
  class ApplicationJob < ActiveJob::Base
    discard_on ActiveJob::DeserializationError
  end
end
