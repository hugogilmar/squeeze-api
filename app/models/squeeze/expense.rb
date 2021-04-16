# frozen_string_literal: true

require 'sidekiq/api'

module Squeeze
  # Expenses model
  class Expense < ApplicationRecord
    store :meta, accessors: %i[job_id], coder: JSON, prefix: true

    belongs_to :budget
    belongs_to :category
    belongs_to :account
    has_one :operation, as: :operable, inverse_of: :operable, dependent: :destroy

    after_create :store_operation!
    after_update :store_operation!
    after_discard do
      operation&.discard
      remove_operation_job!
    end

    # Amount to store on expense operation record
    def operation_amount
      amount.abs * -1
    end

    # Remove operation job if job exists
    def remove_operation_job!
      return if meta_job_id.blank?

      job = Sidekiq::ScheduledSet.new.find_job(meta_job_id)
      job&.delete

      update_column(:meta, meta.except(:job_id))
    end

    # Store expense operation callback
    def store_operation!
      operation_attrs = { account: account, amount: operation_amount }

      remove_operation_job!

      if scheduled_for.present?
        job = StoreOperationJob.set(wait_until: scheduled_for).perform_later(self, operation_attrs)

        update_column(:meta, meta.merge(job_id: job.provider_job_id))

        job
      else
        StoreOperationJob.perform_later(self, operation_attrs)
      end
    end
  end
end
