module Books
  class CrawlBookJob < ApplicationJob
    queue_as :default
    # description "Services crawl only a book"

    def perform(book)
      ::Consoles::Books::CrawlDataService.call(url: book.url, type: book.type)
    end
  end
end
