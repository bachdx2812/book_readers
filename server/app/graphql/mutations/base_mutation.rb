module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    include ExecutionError

    include Guard

    def ready?(**_args)
      authenticate!(:public)
    end
  end
end
