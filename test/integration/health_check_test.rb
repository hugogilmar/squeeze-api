# frozen_string_literal: true

require('rack/test')
require_relative('../../lib/rack/health_check')

# health_check_controller_test.rb
class HealthCheckTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Rack::HealthCheck.new
  end

  def test_health_check
    get('/health')
    assert(last_response.ok?)
  end
end