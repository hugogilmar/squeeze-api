# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative('config/environment')
require_relative('lib/squeeze/rack/health_check')

map '/health_check' do
  run Squeeze::Rack::HealthCheck.new
end

run(Rails.application)
