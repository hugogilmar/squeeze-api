# frozen_string_literal: true

require('test_helper')

module Squeeze
  module V1
    class AccountsControllerTest < ActionDispatch::IntegrationTest
      ACCOUNT_KINDS = %i[bank_account cash credit_card debit_card].freeze
      public_constant :ACCOUNT_KINDS

      def setup
        @user = FactoryBot.create(:user)
        @account = FactoryBot.create(:account, user: @user)
        @token = generate_authentication_token(@user)
        @headers = { 'Content-type': 'application/json', 'Authorization': @token }
      end

      test 'should create account' do
        data = {
          data: {
            description: Faker::Lorem.word,
            kind: ACCOUNT_KINDS.sample,
            reference_number: Faker::Number.number(digits: 4)
          }
        }

        post v1_accounts_url, params: data.to_json, headers: @headers
        assert_response :success
      end

      test 'should not create account by required params missing' do
        data = {
          data: {
            description: Faker::Lorem.word,
            kind: ACCOUNT_KINDS.sample
          }
        }

        post v1_accounts_url, params: data.to_json, headers: @headers
        assert_response :unprocessable_entity
      end

      test 'should not create account by required request format' do
        data = {
          description: Faker::Lorem.word,
          kind: ACCOUNT_KINDS.sample,
          reference_number: Faker::Number.number(digits: 4)
        }

        post v1_accounts_url, params: data.to_json, headers: @headers
        assert_response :bad_request
      end

      test 'should update account' do
        data = {
          data: {
            description: Faker::Lorem.word,
            kind: ACCOUNT_KINDS.sample,
            reference_number: Faker::Number.number(digits: 4)
          }
        }

        put v1_account_url(id: @account.id), params: data.to_json, headers: @headers
        assert_response :success
      end

      test 'should not update account by required params missing' do
        data = {
          data: {
            description: Faker::Lorem.word,
            kind: ACCOUNT_KINDS.sample,
            reference_number: nil
          }
        }

        put v1_account_url(id: @account.id), params: data.to_json, headers: @headers
        assert_response :unprocessable_entity
      end

      test 'should not update account by required request format' do
        data = {
          description: Faker::Lorem.word,
          kind: ACCOUNT_KINDS.sample,
          reference_number: Faker::Number.number(digits: 4)
        }

        put v1_account_url(id: @account.id), params: data.to_json, headers: @headers
        assert_response :bad_request
      end

      test 'should not update account by not found id' do
        data = {
          data: {
            description: Faker::Lorem.word,
            kind: ACCOUNT_KINDS.sample,
            reference_number: Faker::Number.number(digits: 4)
          }
        }

        put v1_account_url(id: Faker::Number.within(range: 100..200)), params: data.to_json, headers: @headers
        assert_response :not_found
      end

      test 'should delete account' do
        delete v1_account_url(id: @account.id), headers: @headers
        assert_response :no_content
      end

      test 'should not delete account by not found id' do
        delete v1_account_url(id: Faker::Number.within(range: 100..200)), headers: @headers
        assert_response :not_found
      end

      test 'should find account' do
        get v1_account_url(id: @account.id), headers: @headers
        assert_response :success
      end

      test 'should not find account by not found id' do
        get v1_account_url(id: Faker::Number.within(range: 100..200)), headers: @headers
        assert_response :not_found
      end

      test 'should find accounts' do
        get v1_accounts_url, headers: @headers
        assert_response :success
      end
    end
  end
end
