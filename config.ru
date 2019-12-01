# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative('config/environment')
require_relative('lib/squeeze/rack/app/health_check')

map '/health_check' do
  run HealthCheck.new
end

run(Rails.application)
