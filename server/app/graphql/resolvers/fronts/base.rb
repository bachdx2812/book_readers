module Resolvers
  module Fronts
    class Base < ::Resolvers::Base
      description "ResolversFrontsBase"

      def ready?(**_args)
        # authenticate!(:user)
        authenticate!(:public)
      end
    end
  end
end
