module Mutations
  module Fronts
    module Users
      class Base < GraphQL::Schema::Mutation
        include ExecutionError

        include Guard

        def ready?(**_args)
          authenticate!(:user)
        end
      end
    end
  end
end
