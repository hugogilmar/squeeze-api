# frozen_string_literal: true

module Squeeze
  module Concerns
    # Resource controller base module
    module ResourceController
      extend ActiveSupport::Concern

      ACTION_COMMANDS = {
        index: 'SearchCommand',
        show: 'FindCommand',
        create: 'CreateCommand',
        update: 'UpdateCommand',
        destroy: 'DeleteCommand'
      }.freeze

      private_constant :ACTION_COMMANDS

      # Resource index endpoint
      def index
        result = resource_command.new(resources_context).call(filter_params)

        render(json: result.value.as_json, status: :ok)
      end

      # Resource show endpoint
      def show
        result = resource_command.new(resource_context).call

        render(json: result.value.as_json, status: :ok)
      end

      # Resource create endpoint
      def create
        result = resource_command.new(resources_context).call(resource_params)

        render(json: result.value.as_json, status: :created)
      end

      # Resource update endpoint
      def update
        result = resource_command.new(resource_context).call(resource_params)

        render(json: result.value.as_json, status: :ok)
      end

      # Resource delete endpoint
      def destroy
        _result = resource_command.new(resource_context).call

        render(nothing: true, status: :no_content)
      end

      private

      # Resource version
      def resource_version
        :V1
      end

      # Resource namespace
      def resource_namespace
        controller_name.camelize
      end

      # Resource action command mapper
      def resource_action_command
        ACTION_COMMANDS[action_name.to_sym]
      end

      # Resource command
      def resource_command
        "Squeeze::#{resource_version}::#{resource_namespace}::#{resource_action_command}".constantize
      end

      # Resource collection context
      def resources_context
        { current_user: current_user }.merge(resources_extra_context)
      end

      # Resources extra context
      def resources_extra_context
        {}
      end

      # Resource member context
      def resource_context
        resources_context.merge(resource_id: resource_param_id).merge(resource_extra_context)
      end

      # Resource extra context
      def resource_extra_context
        {}
      end

      # Resource allowed params
      def resource_params
        params.require(:data).permit(*resource_permitted_params)
      end

      # Resource allowed filter params
      def filter_params
        params.permit(*resource_filter_permitted_params)
      end

      # Resource param id
      def resource_param_id
        params[:id]
      end

      # Resource permitted params
      def resource_permitted_params
        raise(NotImplementedError, 'resource_permitted_params method not implemented')
      end

      # Resource permitted filter params
      def resource_filter_permitted_params
        raise(NotImplementedError, 'resource_filter_permitted_params method not implemented')
      end
    end
  end
end
