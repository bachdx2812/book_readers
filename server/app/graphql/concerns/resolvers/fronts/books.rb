module Resolvers
  module Fronts
    module Books
      extend ActiveSupport::Concern

      included do
        field :fronts_books, resolver: ::Resolvers::Fronts::Books::Index, description: "Books Index"
      end
    end
  end
end
