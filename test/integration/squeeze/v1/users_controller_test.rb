# frozen_string_literal: true

require('test_helper')

module Squeeze
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
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
    end
  end
end
