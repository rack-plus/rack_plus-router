module RackPlus
  module Router
    ##
    # A router which holds a collection of other routers, and delegates
    # routing to the routers in its collection.
    class CollectionRouter
      def initialize(routers=[])
        @routers = routers
      end

      def << router
        @routers << router
      end

      def call(environment)
        @routers.each do |router|
          return router.call(environment) || next
        end
        nil
      end
    end
  end
end
