# frozen_string_literal: true

module Squeeze
  # Store operation job for operable model
  class StoreOperationJob < ApplicationJob
    queue_as :default

    # Create or update operable operation
    def perform(operable, operation_attrs)
      operable.operation.nil? ? operable.create_operation(operation_attrs) : operable.operation.update(operation_attrs)
    end
  end
end
