# frozen_string_literal: true

module Squeeze
  module V1
    module Base
      # Search command base class
      class SearchCommand < ApplicationCommand
        context current_user: nil
        attr_reader :params

        # Command execution
        def call(params = {})
          @params = params

          return failure(:bad_request) if models.nil?

          success(serializer)
        end

        private

        # Pagination per page limit param
        def per_page
          @per_page ||= params[:per_page] || Kaminari.config.default_per_page
        end

        # Pagination current page param
        def page
          @page ||= params[:page] || 1
        end

        # Pagination metadata
        def metadata
          return {} unless models.respond_to?(:total_count)

          {
            total_count: models.total_count,
            total_pages: models.total_pages,
            current_page: models.current_page,
            next_page: models.next_page,
            prev_page: models.prev_page
          }
        end

        # Models builder
        def models
          raise(NotImplementedError, 'models method not implemented')
        end

        # Serializer builder
        def serializer
          @serializer ||= ActiveModelSerializers::SerializableResource.new(models, meta: metadata, each_serializer: serializer_class)
        end

        # Serializer class used for json serialization
        def serializer_class
          raise(NotImplementedError, 'serializer_class method not implemented')
        end
      end
    end
  end
end
