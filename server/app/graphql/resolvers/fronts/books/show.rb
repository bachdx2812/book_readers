module Resolvers
  module Fronts
    module Books
      class Show < ::Resolvers::Fronts::Base
        graphql_name "FrontsBooksShow"
        description "FrontsBooksShow"

        argument :slug, String, required: true, description: "Book Slug"

        def resolve(slug:)
          Book.friendly.find(slug)
        end
      end
    end
  end
end
