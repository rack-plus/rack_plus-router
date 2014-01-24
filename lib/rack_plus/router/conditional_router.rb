module RackPlus
  module Router
    ##
    # A simple router that takes an application and a block. The router calls
    # the block with the rack environment as an argument, and returns the
    # application if the block returns true, otherwise it returns nil.
    class ConditionalRouter
      def initialize(application, &block)
        @route = application
        @condition = block
      end

      def matches?(environment)
        @condition.call(environment)
      end

      def call(environment)
        return @route if matches? environment
      end
    end
  end
end
