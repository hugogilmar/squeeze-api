# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

map '/health_check' do
  run Squeeze::Rack::App::HealthCheck.new
end

run Rails.application
