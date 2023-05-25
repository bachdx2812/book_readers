module Types
  class QueryType < Types::BaseObject
    description "QueryType"

    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    include Resolvers::Consoles::Users
    include Resolvers::Fronts::Books
  end
end
