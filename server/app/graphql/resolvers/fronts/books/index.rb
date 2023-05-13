module Resolvers
  module Fronts
    module Books
      class Index < ::Resolvers::Fronts::Base
        graphql_name "FrontsBooksIndex"
        description "FrontsBooksIndex"

        argument :input, ::Types::Arguments::PagyInput, required: false, description: "Pagy Input"

        type ::Types::Payloads::Admins::OrderType.pagy_type, null: false

        def resolve(input: {})
          q = input[:q] || {}

          collection = ::Book.
            ransack(q).
            result(distinct: true).
            order(id: :desc)

          pagy(collection, per_page: input[:per_page], page: input[:page])
        end
      end
    end
  end
end
