module Types
  module Arguments
    class CrawlerInput < ::Types::BaseInputObject
      graphql_name "CrawlerInput"
      description "CrawlerInput"

      argument :type, String, required: true, description: "Type link to crawl"
      argument :url, String, required: true, description: "URL of book to crawl"
    end
  end
end
