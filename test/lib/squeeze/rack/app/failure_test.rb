# frozen_string_literal: true

require('test_helper')

module Squeeze
  module Rack
    module App
      class FailureTest < Minitest::Test
        def app
          Failure.new
        end

        def test_app
          get('/')
          assert(last_response.unauthorized?)
        end
      end
    end
  end
end
