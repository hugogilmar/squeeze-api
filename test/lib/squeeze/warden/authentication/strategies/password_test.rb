# frozen_string_literal: true

require('test_helper')

module Squeeze
  module Warden
    module Authentication
      module Strategies
        class PasswordTest < Minitest::Test
          def setup
            @user = FactoryBot.create(:user)
          end

          def test_authenticate
            parsed_params = -> { { 'data' => { 'email' => @user.email, 'password' => @user.password } } }
            stub_any_instance(Password, :parsed_params, parsed_params) do
              warden.authenticate(:password)
              assert_equal(true, warden.authenticated?)
            end
          end

          def test_authenticate_with_bad_credentials
            parsed_params = -> { { 'data' => { 'email' => Faker::Internet::free_email, 'password' => Faker::Internet.password } } }
            stub_any_instance(Password, :parsed_params, parsed_params) do
              warden.authenticate(:password)
              assert_equal(false, warden.authenticated?)
            end
          end

          def request
            @request ||= ::Rack::Request.new(::Rack::MockRequest.env_for("http://example.com:8080/", {"REMOTE_ADDR" => "10.10.10.10"}))
          end

          def warden
            @warden ||= begin
              manager = ::Warden::Manager.new(nil, &Rails.application.config.middleware.detect{|m| m.name == 'Warden::Manager'}.block)
              request.env['warden'] = ::Warden::Proxy.new(request.env, manager)
            end
          end
        end
      end
    end
  end
end
