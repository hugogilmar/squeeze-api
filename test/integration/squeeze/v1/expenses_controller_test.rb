# frozen_string_literal: true

require('test_helper')

module Squeeze
  module V1
    class ExpensesControllerTest < ActionDispatch::IntegrationTest
      def setup
        @user = FactoryBot.create(:user)
        @budget = FactoryBot.create(:budget, user: @user)
        @account = FactoryBot.create(:account, user: @user)
        @category = FactoryBot.create(:category, budget: @budget)
        @expense = FactoryBot.create(:expense, budget: @budget, category: @category, account: @account)
        @token = bearer_token(@user)
        @headers = { 'Content-type': 'application/json', 'Authorization': @token }
      end

      test 'should create expense' do
        data = {
          data: {
            category_id: @category.id,
            account_id: @account.id,
            description: Faker::Lorem.word,
            amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
          }
        }

        post v1_budget_expenses_url(budget_id: @budget.id), params: data.to_json, headers: @headers
        assert_response :success
      end

      test 'should not create expense by required params missing' do
        data = {
          data: {
            category_id: @category.id,
            account_id: @account.id,
            description: nil,
            amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
          }
        }

        post v1_budget_expenses_url(budget_id: @budget.id), params: data.to_json, headers: @headers
        assert_response :unprocessable_entity
      end

      test 'should not create expense by required request format' do
        data = {
          category_id: @category.id,
          account_id: @account.id,
          description: Faker::Lorem.word,
          amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
        }

        post v1_budget_expenses_url(budget_id: @budget.id), params: data.to_json, headers: @headers
        assert_response :bad_request
      end

      test 'should not create expense by budget not found id' do
        data = {
          data: {
            category_id: @category.id,
            account_id: @account.id,
            description: Faker::Lorem.word,
            amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
          }
        }

        post v1_budget_expenses_url(budget_id: Faker::Number.within(range: 100..200)), params: data.to_json, headers: @headers
        assert_response :not_found
      end

      test 'should update expense' do
        data = {
          data: {
            category_id: @category.id,
            account_id: @account.id,
            description: Faker::Lorem.word,
            amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
          }
        }

        put v1_budget_expense_url(budget_id: @budget.id, id: @expense.id), params: data.to_json, headers: @headers
        assert_response :success
      end

      test 'should not update expense by required params missing' do
        data = {
          data: {
            category_id: @category.id,
            account_id: @account.id,
            description: nil,
            amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
          }
        }

        put v1_budget_expense_url(budget_id: @budget.id, id: @expense.id), params: data.to_json, headers: @headers
        assert_response :unprocessable_entity
      end

      test 'should not update expense by required request format' do
        data = {
          category_id: @category.id,
          account_id: @account.id,
          description: Faker::Lorem.word,
          amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
        }

        put v1_budget_expense_url(budget_id: @budget.id, id: @expense.id), params: data.to_json, headers: @headers
        assert_response :bad_request
      end

      test 'should not update expense by not found id' do
        data = {
          data: {
            category_id: @category.id,
            account_id: @account.id,
            description: Faker::Lorem.word,
            amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
          }
        }

        put v1_budget_expense_url(budget_id: @budget.id, id: Faker::Number.within(range: 100..200)), params: data.to_json, headers: @headers
        assert_response :not_found
      end

      test 'should not update expense by budget not found id' do
        data = {
          data: {
            category_id: @category.id,
            account_id: @account.id,
            description: Faker::Lorem.word,
            amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
          }
        }

        put v1_budget_expense_url(budget_id: Faker::Number.within(range: 100..200), id: Faker::Number.within(range: 100..200)), params: data.to_json, headers: @headers
        assert_response :not_found
      end

      test 'should delete expense' do
        delete v1_budget_expense_url(budget_id: @budget.id, id: @expense.id), headers: @headers
        assert_response :no_content
      end

      test 'should not delete expense by not found id' do
        delete v1_budget_expense_url(budget_id: @budget.id, id: Faker::Number.within(range: 100..200)), headers: @headers
        assert_response :not_found
      end

      test 'should not delete expense by budget not found id' do
        delete v1_budget_expense_url(budget_id: Faker::Number.within(range: 100..200), id: Faker::Number.within(range: 100..200)), headers: @headers
        assert_response :not_found
      end

      test 'should not delete expense by exception' do
        raises_exception = -> { raise Discard::RecordNotDiscarded.new(nil, @expense) }
        stub_any_instance(Squeeze::ApplicationRecord, :discard!, raises_exception) do
          delete v1_budget_expense_url(budget_id: @budget.id, id: @expense.id), headers: @headers
          assert_response :unprocessable_entity
        end
      end

      test 'should find expense' do
        get v1_budget_expense_url(budget_id: @budget.id, id: @expense.id), headers: @headers
        assert_response :success
      end

      test 'should not find expense by not found id' do
        get v1_budget_expense_url(budget_id: @budget.id, id: Faker::Number.within(range: 100..200)), headers: @headers
        assert_response :not_found
      end

      test 'should not find expense by budget not found id' do
        get v1_budget_expense_url(budget_id: Faker::Number.within(range: 100..200), id: Faker::Number.within(range: 100..200)), headers: @headers
        assert_response :not_found
      end

      test 'should find expenses' do
        get v1_budget_expenses_url(budget_id: @budget.id), headers: @headers
        assert_response :success
      end

      test 'should not find expenses by budget not found id' do
        get v1_budget_expenses_url(budget_id: Faker::Number.within(range: 100..200)), headers: @headers
        assert_response :not_found
      end
    end
  end
end
