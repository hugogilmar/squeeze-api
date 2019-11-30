# frozen_string_literal: true

require('test_helper')
require('rack/test')
require('squeeze/rack/unauthorized')

module Squeeze
  module Rack
    class UnauthorizedTest < Minitest::Test
      include ::Rack::Test::Methods

      def app
        Unauthorized.new
      end

      def test_app
        get('/')
        assert(last_response.unauthorized?)
      end
    end
  end
end
