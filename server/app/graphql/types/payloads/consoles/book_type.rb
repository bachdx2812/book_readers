module Types
  module Payloads
    module Consoles
      class BookType < Types::BaseObject
        graphql_name "ConsolesBookType"
        description "ConsolesBookType"

        field :author_name, String, null: true, description: "Author Name"
        field :description, String, null: true, description: "Description"
        field :id, ID, null: true, description: "Id"
        field :slug, String, null: true, description: "Slug"
        field :title, String, null: true, description: "Title"

        field :created_at, GraphQL::Types::ISO8601DateTime, null: true, description: "Created At"
        field :published_date, GraphQL::Types::ISO8601DateTime, null: true, description: "Publish At"
        field :updated_at, GraphQL::Types::ISO8601DateTime, null: true, description: "Updated At"
      end
    end
  end
end
