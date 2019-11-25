# frozen_string_literal: true

require('test_helper')

require_relative('../../../support/token_test_helpers')

module Squeeze
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
      include TokenTestHelpers

      def setup
        @user = FactoryBot.create(:user)
        @token = generate_authentication_token(@user)
      end

      test 'should create user' do
        password = Faker::Internet.password
        data = {
          data: {
            email: Faker::Internet.email,
            password: password,
            password_confirmation: password,
            profile: {
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name
            }
          }
        }

        post v1_users_url, params: data.to_json, headers: { 'Content-type': 'application/json' }
        assert_response :success
      end

      test 'should not create user by required params missing' do
        password = Faker::Internet.password
        data = {
          data: {
            email: Faker::Internet.email,
            password: password,
            password_confirmation: password
          }
        }

        post v1_users_url, params: data.to_json, headers: { 'Content-type': 'application/json' }
        assert_response :unprocessable_entity
      end

      test 'should not create user by required request format' do
        password = Faker::Internet.password
        data = {
          email: Faker::Internet.email,
          password: password,
          password_confirmation: password
        }

        post v1_users_url, params: data.to_json, headers: { 'Content-type': 'application/json' }
        assert_response :bad_request
      end

      test 'should update user' do
        data = {
          data: {
            profile: {
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name
            }
          }
        }

        put v1_user_url, params: data.to_json, headers: { 'Content-type': 'application/json', 'Authorization': @token }
        assert_response :success
      end

      test 'should not update user by missing authorization header' do
        data = {
          data: {
            profile: {
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name
            }
          }
        }

        put v1_user_url, params: data.to_json, headers: { 'Content-type': 'application/json' }
        assert_response :unauthorized
      end

      test 'should not update user by wrong authorization token' do
        token = Faker::Crypto.md5
        data = {
          data: {
            profile: {
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name
            }
          }
        }

        put v1_user_url, params: data.to_json, headers: { 'Content-type': 'application/json', 'Authorization': token }
        assert_response :unauthorized
      end

      test 'should not update user by required params missing' do
        data = {
          data: {
            profile: {
              first_name: Faker::Name.first_name,
              last_name: nil
            }
          }
        }

        put v1_user_url, params: data.to_json, headers: { 'Content-type': 'application/json', 'Authorization': @token }
        assert_response :unprocessable_entity
      end

      test 'should not update user by required request format' do
        data = {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name
        }

        put v1_user_url, params: data.to_json, headers: { 'Content-type': 'application/json', 'Authorization': @token }
        assert_response :bad_request
      end
    end
  end
end
