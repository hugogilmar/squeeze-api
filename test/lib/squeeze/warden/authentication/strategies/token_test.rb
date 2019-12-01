# frozen_string_literal: true

require('test_helper')

module Squeeze
  module Warden
    module Authentication
      module Strategies
        class TokenTest < Minitest::Test
          def setup
            @strategy = Token.new
          end
        end
      end
    end
  end
end
