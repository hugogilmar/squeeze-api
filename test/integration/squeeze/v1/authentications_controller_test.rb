# frozen_string_literal: true

require 'test_helper'

module Squeeze
  module V1
    class AuthenticationsControllerTest < ActionDispatch::IntegrationTest
      def setup
        @user = FactoryBot.create(:user)
      end

      test 'should authenticate user' do
        data = {
          data: {
            email: @user.email,
            password: @user.password
          }
        }

        post v1_authentication_url, params: data.to_json, headers: { 'Content-type': 'application/json' }
        assert_response :success
      end
    end
  end
end
