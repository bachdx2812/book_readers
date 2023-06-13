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

        if service&.success?
          # create book with status draft
          blobs = Consoles::Books::CrawlImageService.call(urls: service.result.images)

          book = Book.create!(
            title: service.result.title,
            description: service.result.description,
            author_name: service.result.author_name,
            status: :draft,
          )

          book.images.attach(blobs.images)
        end
      end
    end
  end
end
