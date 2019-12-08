# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      # Persist command base class
      class PersistCommand < MemberCommand
        # Command execution
        def call(params)
          raise(ActiveRecord::RecordInvalid, form) unless form.validate(params)

          form.sync
          form.model.save!
          success(serializer)
        end

        private

        # Form builder
        def form
          @form ||= form_class.new(model)
        end

        # Form class used for params validation
        def form_class
          raise(NotImplementedError, 'form_class method not implemented')
        end
      end
    end
  end
end
