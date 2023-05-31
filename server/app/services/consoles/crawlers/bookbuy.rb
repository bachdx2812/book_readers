# Input:
## url: String
#### https://bookbuy.vn/sach/ai-cung-xung-dang-co-mot-cuoc-song-tot-hon-p122711.html
# Ouput:
## result: BookSource

module Consoles
  module Crawlers
    class Bookbuy < Base
      private

      def crawl
        book_source = BookSource.new

        # Visit URL
        context.session.visit(context.url)

        # Find and get `title`
        book_source.title = context.session.find(".des-detail > h1.title").text

        # Find and get `images`
        book_source.add_image(context.session.find(".main-img.img-view > a > img")["src"])

        # Author
        book_source.author_name = context.session.find(".author-list > a > h2.author").text

        # Description
        book_source.description = context.session.find(".des-des")["innerHTML"]

        context.result = book_source
      end
    end
  end
end
