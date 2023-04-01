module Types
  module Payloads
    module Consoles
      class UserType < Types::BaseObject
        graphql_name "ConsolesUserType"
        description "ConsolesUserType"

        field :email, String, null: true, description: "Email"
        field :id, ID, null: true, description: "Id"
        field :slack_id, String, null: true, description: "Slack Id"

        field :created_at, GraphQL::Types::ISO8601DateTime, null: true, description: "Created At"
        field :updated_at, GraphQL::Types::ISO8601DateTime, null: true, description: "Updated At"
      end
    end
  end
end
