module Resolvers
  module Consoles
    module Users
      class Index < ::Resolvers::Consoles::Base
        graphql_name "ConsolesUsersIndex"
        description "ConsolesUsersIndex"

        argument :input, ::Types::Arguments::PagyInput, required: false, description: "Query Input"

        type ::Types::Payloads::Consoles::UserType.pagy_type, null: false

        def resolve(input: {})
          q = input[:q] || {}

          collection = ::User.
            ransack(q).
            result(distinct: true).
            order(id: :desc)

          pagy(collection, per_page: input[:per_page], page: input[:page])
        end
      end
    end
  end
end
