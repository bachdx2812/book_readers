module Resolvers
  class Base < GraphQL::Schema::Resolver
    include ExecutionError
    include Guard
    include Paginatable

    description "BaseResolver"

    def ready?(**_args)
      authenticate!(:public)
    end
  end
end
