# frozen_string_literal: true

require 'test_helper'

module Squeeze
  module V1
    class CategoriesControllerTest < ActionDispatch::IntegrationTest
      def setup
        @user = FactoryBot.create(:user)
        @budget = FactoryBot.create(:budget, user: @user)
        @category = FactoryBot.create(:category, budget: @budget)
        @token = bearer_token(@user)
        @headers = { 'Content-type': 'application/json', 'Authorization': @token }
      end

      test 'should create category' do
        data = {
          data: {
            description: Faker::Lorem.word,
            amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
          }
        }

        post v1_budget_categories_url(budget_id: @budget.id), params: data.to_json, headers: @headers
        assert_response :success
      end

      test 'should not create category by required params missing' do
        data = {
          data: {
            description: nil,
            amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
          }
        }

        post v1_budget_categories_url(budget_id: @budget.id), params: data.to_json, headers: @headers
        assert_response :unprocessable_entity
      end

      test 'should not create category by required request format' do
        data = {
          description: Faker::Lorem.word,
          amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
        }

        post v1_budget_categories_url(budget_id: @budget.id), params: data.to_json, headers: @headers
        assert_response :bad_request
      end

      test 'should not create category by budget not found id' do
        data = {
          data: {
            description: Faker::Lorem.word,
            amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
          }
        }

        post v1_budget_categories_url(budget_id: Faker::Number.within(range: 100..200)), params: data.to_json, headers: @headers
        assert_response :not_found
      end

      test 'should update category' do
        data = {
          data: {
            description: Faker::Lorem.word,
            amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
          }
        }

        put v1_budget_category_url(budget_id: @budget.id, id: @category.id), params: data.to_json, headers: @headers
        assert_response :success
      end

      test 'should not update category by required params missing' do
        data = {
          data: {
            description: nil,
            amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
          }
        }

        put v1_budget_category_url(budget_id: @budget.id, id: @category.id), params: data.to_json, headers: @headers
        assert_response :unprocessable_entity
      end

      test 'should not update category by required request format' do
        data = {
          description: Faker::Lorem.word,
          amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
        }

        put v1_budget_category_url(budget_id: @budget.id, id: @category.id), params: data.to_json, headers: @headers
        assert_response :bad_request
      end

      test 'should not update category by not found id' do
        data = {
          data: {
            description: Faker::Lorem.word,
            amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
          }
        }

        put v1_budget_category_url(budget_id: @budget.id, id: Faker::Number.within(range: 100..200)), params: data.to_json, headers: @headers
        assert_response :not_found
      end

      test 'should not update category by budget not found id' do
        data = {
          data: {
            description: Faker::Lorem.word,
            amount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
          }
        }

        put v1_budget_category_url(budget_id: Faker::Number.within(range: 100..200), id: Faker::Number.within(range: 100..200)), params: data.to_json, headers: @headers
        assert_response :not_found
      end

      test 'should delete category' do
        delete v1_budget_category_url(budget_id: @budget.id, id: @category.id), headers: @headers
        assert_response :no_content
      end

      test 'should not delete category by not found id' do
        delete v1_budget_category_url(budget_id: @budget.id, id: Faker::Number.within(range: 100..200)), headers: @headers
        assert_response :not_found
      end

      test 'should not delete category by budget not found id' do
        delete v1_budget_category_url(budget_id: Faker::Number.within(range: 100..200), id: Faker::Number.within(range: 100..200)), headers: @headers
        assert_response :not_found
      end

      test 'should not delete category by exception' do
        raises_exception = -> { raise Discard::RecordNotDiscarded.new(nil, @category) }
        stub_any_instance(Squeeze::ApplicationRecord, :discard!, raises_exception) do
          delete v1_budget_category_url(budget_id: @budget.id, id: @category.id), headers: @headers
          assert_response :unprocessable_entity
        end
      end

      test 'should find category' do
        get v1_budget_category_url(budget_id: @budget.id, id: @category.id), headers: @headers
        assert_response :success
      end

      test 'should not find category by not found id' do
        get v1_budget_category_url(budget_id: @budget.id, id: Faker::Number.within(range: 100..200)), headers: @headers
        assert_response :not_found
      end

      test 'should not find category by budget not found id' do
        get v1_budget_category_url(budget_id: Faker::Number.within(range: 100..200), id: Faker::Number.within(range: 100..200)), headers: @headers
        assert_response :not_found
      end

      test 'should find categories' do
        get v1_budget_categories_url(budget_id: @budget.id), headers: @headers
        assert_response :success
      end

      test 'should not find categories by budget not found id' do
        get v1_budget_categories_url(budget_id: Faker::Number.within(range: 100..200)), headers: @headers
        assert_response :not_found
      end
    end
  end
end
