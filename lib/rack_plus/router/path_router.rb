require 'rack_plus/router/conditional_router'

module RackPlus
  module Router
    ##
    # A simple router that routes a single path with a given method to a given
    # application.
    class PathRouter < ConditionalRouter
      def initialize(path, application)
        path = strip_slashes(path)
        super(application) do |environment|
          strip_slashes(environment["PATH_INFO"]) == path # Crazy simple, needs more features
        end
      end

      private

      def strip_slashes(path)
        path.gsub(/^\//, '').gsub(/\/$/, '')
      end
    end
  end
end
