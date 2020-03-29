require 'test_helper'

module Squeeze
  class StoreOperationJobTest < ActiveJob::TestCase
    def setup
      @user = FactoryBot.create(:user)
      @budget = FactoryBot.create(:budget, user: @user)
      @account = FactoryBot.create(:account, user: @user)
      @category = FactoryBot.create(:category, budget: @budget)
      @income = FactoryBot.create(:income, budget: @budget, category: @category, account: @account)
      @expense = FactoryBot.create(:expense, budget: @budget, category: @category, account: @account)
    end

    def test_should_enqueue_job
      assert_enqueued_jobs 2 do
        operation_attrs = { account: @account, amount: @income.amount.abs * 1 }
        StoreOperationJob.perform_later(@income, operation_attrs)
        operation_attrs = { account: @account, amount: @expense.amount.abs * -1 }
        StoreOperationJob.perform_later(@expense, operation_attrs)
      end
    end

    def test_should_perform_job
      assert_performed_jobs 2 do
        operation_attrs = { account: @account, amount: @income.amount.abs * 1 }
        StoreOperationJob.perform_later(@income, operation_attrs)
        operation_attrs = { account: @account, amount: @expense.amount.abs * -1 }
        StoreOperationJob.perform_later(@expense, operation_attrs)
      end
    end
  end
end
