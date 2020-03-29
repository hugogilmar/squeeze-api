# frozen_string_literal: true

require('test_helper')

module Squeeze
  module V1
    class OperationsControllerTest < ActionDispatch::IntegrationTest
      def setup
        @user = FactoryBot.create(:user)
        @account = FactoryBot.create(:account, user: @user)
        @budget = FactoryBot.create(:budget, user: @user)
        @category = FactoryBot.create(:category, budget: @budget)
        @income = FactoryBot.create(:income, budget: @budget, category: @category, account: @account)
        @expense = FactoryBot.create(:expense, budget: @budget, category: @category, account: @account)
        @income_operation = FactoryBot.create(:operation, account: @account, operable: @income)
        @expense_operation = FactoryBot.create(:operation, account: @account, operable: @expense)
        @token = bearer_token(@user)
        @headers = { 'Content-type': 'application/json', 'Authorization': @token }
      end

      test 'should find operations' do
        get v1_account_operations_url(account_id: @account.id), headers: @headers
        assert_response :success
      end

      test 'should not find operations by account not found id' do
        get v1_account_operations_url(account_id: Faker::Number.within(range: 100..200)), headers: @headers
        assert_response :not_found
      end
    end
  end
end
