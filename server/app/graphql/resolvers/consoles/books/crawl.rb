module Resolvers
  module Consoles
    module Books
      class Crawl < ::Resolvers::Consoles::Base
        graphql_name "ConsolesBookCrawl"
        description "ConsolesBookCrawl"

        argument :type, String, required: true, description: "Type link to crawl"
        argument :url, String, required: true, description: "URL of book to crawl"

        type ::Types::Payloads::Consoles::BookType, null: true

        def resolve(url:, type:)
          service = ::Consoles::Books::CrawlDataService.call(url:, type:)

          if service.success? && service.data.present?
            service.data
          end
        end
      end
    end
  end
end
