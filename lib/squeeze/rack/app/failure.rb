# frozen_string_literal: true

module Squeeze
  module Rack
    module App
      # Failure response app
      class Failure
        # Build endpoint response data
        def call(_env)
          [401, headers, [body.to_json]]
        end

        protected

        def headers
          {
            "Content-Type": 'application/json'
          }
        end

        def body
          { error: 'Unauthorized' }
        end
      end
    end
  end
end
