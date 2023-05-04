module Types
  class QueryType < Types::BaseObject
    description "QueryType"

    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    include Resolvers::Consoles::Users

    field :hello, String, "Find a post by ID"

    def hello
      "String"
    end
  end
end
