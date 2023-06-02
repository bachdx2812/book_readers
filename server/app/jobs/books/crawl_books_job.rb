module Books
  class CrawlBooksJob < ApplicationJob
    queue_as :default
    # description "Services crawl books with list book source"

    def perform(list_book_source)
      list_book_source.each do |bs|
        ::Books::CrawlBookJob.perform_now(bs)
      end
    end
  end
end
