module Types
  module Payloads
    module Fronts
      class BookType < Types::BaseObject
        graphql_name "FrontsBookType"
        description "FrontsBookType"


        field :id, ID, null: true, description: "Id"
        field :title, String, null: true, description: "title"
        field :author, String, null: true, description: "author"
        field :image_url,String, null: true, description: "image url"
        field :description,String, null: true, description: "description"

        field :created_at, GraphQL::Types::ISO8601DateTime, null: true, description: "Created At"
        field :updated_at, GraphQL::Types::ISO8601DateTime, null: true, description: "Updated At"
      end
    end
  end
end
