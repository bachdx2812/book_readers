module Resolvers
  module Consoles
    module Books
      extend ActiveSupport::Concern

      included do
        field :consoles_books_crawl, resolver: ::Resolvers::Consoles::Books::Crawl, description: "Consoles Book crawl data"
      end
    end
  end
end
