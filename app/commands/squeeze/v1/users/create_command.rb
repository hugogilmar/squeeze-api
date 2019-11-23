# frozen_string_literal: true

module Squeeze
  module V1
    module Users
      # Command base class
      class CreateCommand < Base::CreateCommand
        private

        def model_class
          User
        end

        def form_class
          CreateForm
        end

        def serializer_class
          UserSerializer
        end
      end
    end
  end
end
