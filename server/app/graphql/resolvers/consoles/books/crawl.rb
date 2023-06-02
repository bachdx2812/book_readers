module Resolvers
  module Consoles
    module Books
      class Crawl < ::Resolvers::Consoles::Base
        graphql_name "ConsolesBookCrawl"
        description "ConsolesBookCrawl"

        argument :input, [::Types::Arguments::CrawlerInput], required: false, description: "Crawler input"

        type String, null: true

        def resolve(input:)
          result = ::Books::CrawlBooksJob.perform_now(input)

          if result
            I18n.t("actions.books.crawl.success")
          else
            I18n.t("actions.books.crawl.failed")
          end
          # TODO return number of book -> crawl success, failed
        end
      end
    end
  end
end
