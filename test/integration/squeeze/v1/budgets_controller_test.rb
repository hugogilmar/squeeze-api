# frozen_string_literal: true

require('test_helper')

module Squeeze
  module V1
    class BudgetsControllerTest < ActionDispatch::IntegrationTest
      ACCOUNT_KINDS = %i[bank_budget cash credit_card debit_card].freeze
      public_constant :ACCOUNT_KINDS

      def setup
        @user = FactoryBot.create(:user)
        @budget = FactoryBot.create(:budget, user: @user)
        @token = generate_authentication_token(@user)
        @headers = { 'Content-type': 'application/json', 'Authorization': @token }
      end

      test 'should create budget' do
        data = {
          data: {
            description: Faker::Lorem.word
          }
        }

        post v1_budgets_url, params: data.to_json, headers: @headers
        assert_response :success
      end

      test 'should not create budget by required params missing' do
        data = {
          data: {
            description: nil
          }
        }

        post v1_budgets_url, params: data.to_json, headers: @headers
        assert_response :unprocessable_entity
      end

      test 'should not create budget by required request format' do
        data = {
          description: Faker::Lorem.word
        }

        post v1_budgets_url, params: data.to_json, headers: @headers
        assert_response :bad_request
      end

      test 'should update budget' do
        data = {
          data: {
            description: Faker::Lorem.word
          }
        }

        put v1_budget_url(id: @budget.id), params: data.to_json, headers: @headers
        assert_response :success
      end

      test 'should not update budget by required params missing' do
        data = {
          data: {
            description: nil
          }
        }

        put v1_budget_url(id: @budget.id), params: data.to_json, headers: @headers
        assert_response :unprocessable_entity
      end

      test 'should not update budget by required request format' do
        data = {
          description: Faker::Lorem.word
        }

        put v1_budget_url(id: @budget.id), params: data.to_json, headers: @headers
        assert_response :bad_request
      end

      test 'should not update budget by not found id' do
        data = {
          data: {
            description: Faker::Lorem.word
          }
        }

        put v1_budget_url(id: Faker::Number.within(range: 100..200)), params: data.to_json, headers: @headers
        assert_response :not_found
      end

      test 'should delete budget' do
        delete v1_budget_url(id: @budget.id), headers: @headers
        assert_response :no_content
      end

      test 'should not delete budget by not found id' do
        delete v1_budget_url(id: Faker::Number.within(range: 100..200)), headers: @headers
        assert_response :not_found
      end

      test 'should not delete budget by exception' do
        raises_exception = -> { raise ActiveRecord::RecordNotDestroyed.new(nil, @budget) }
        stub_any_instance(ActiveRecord::Base, :destroy!, raises_exception) do
          delete v1_budget_url(id: @budget.id), headers: @headers
          assert_response :unprocessable_entity
        end
      end

      test 'should find budget' do
        get v1_budget_url(id: @budget.id), headers: @headers
        assert_response :success
      end

      test 'should not find budget by not found id' do
        get v1_budget_url(id: Faker::Number.within(range: 100..200)), headers: @headers
        assert_response :not_found
      end

      test 'should find budgets' do
        get v1_budgets_url, headers: @headers
        assert_response :success
      end
    end
  end
end
