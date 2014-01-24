require 'rack_plus/router/collection_router'
require 'rack_plus/router/path_router'

module RackPlus
  module Router
    ##
    # A subclass of CollectionRouter which provides a simple, Rails-like DSL
    # for declaring routes to Rack+ controllers.
    class Simple < CollectionRouter
      def initialize(&block)
        super()
        instance_exec(&block)
      end

      ##
      # Matches the given path to the given controller and action.
      #
      # Options:
      #
      # * controller - The class of the Rack+ controller to target the route
      #                to. (Required)
      # * action     - The action to send to the Rack+ controller. (Required)
      def match(path, options={})
        controller = options[:controller] || (throw ArgumentError.new("Missing required option `:controller`"))
        action = options[:action] || (throw ArgumentError.new("Missing required option `:action`"))

        self << PathRouter.new(path, create_route(controller, action))
      end

      private

      def create_route(controller, action)
        Proc.new do |environment|
          controller.new(environment).public_send(action)
        end
      end
    end
  end
end
