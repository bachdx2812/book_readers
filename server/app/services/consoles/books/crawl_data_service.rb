module Consoles
  module Books
    class CrawlDataService
      include Interactor

      def call
        service = case context.type.to_sym
                  when :tiki
                    Consoles::Crawlers::Tiki.call(url: context.url)
                  when :bookbuy
                    Consoles::Crawlers::Bookbuy.call(url: context.url)
                  when :fahasa
                    Consoles::Crawlers::Fahasa.call(url: context.url)
                  when :nhanam
                    Consoles::Crawlers::Nhanam.call(url: context.url)
                  when :vinabook
                    Consoles::Crawlers::Vinabook.call(url: context.url)
                  end

        context.data = service.result if service.success?
      end
    end
  end
end
