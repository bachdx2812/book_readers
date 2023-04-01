module Resolvers
  module Consoles
    class Base < ::Resolvers::Base
      description "ResolversConsolesBase"

      def ready?(**_args)
        # authenticate!(:user)
        authenticate!(:public)
      end
    end
  end
end
