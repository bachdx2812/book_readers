# Input:
## url: String
#### http://nhanam.com.vn/sach/40699/di-tim-dora
# Ouput:
## result: BookSource

module Consoles
  module Crawlers
    class Nhanam < Base
      private

      def crawl
        book_source = BookSource.new

        # Visit URL
        context.session.visit(context.url)

        # Find and get `title`
        book_source.title = context.session.find(".info > h1 > a").text

        # Find and get `images`
        book_source.add_image(context.session.find(".bookdetail .image img")["src"])

        # Author
        book_source.author_name = context.session.find(".attributes > ul > li:nth-child(2) > a").text

        # Description
        book_source.description = context.session.find(".bookdetailblockcontent")["innerHTML"]

        context.result = book_source
      end
    end
  end
end
