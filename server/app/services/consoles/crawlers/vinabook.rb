# Input:
## url: String
#### https://www.vinabook.com/einstein-cuoc-doi-va-vu-tru-tai-ban-2022-p95352.html
# Ouput:
## result: BookSource

module Consoles
  module Crawlers
    class Vinabook < Base
      private

      def crawl
        book_source = BookSource.new

        # Visit URL
        context.session.visit(context.url)

        # Find and get `title`
        book_source.title = context.session.find(".product-info > .mainbox-title").text

        # Find and get `images`
        book_source.add_image(context.session.find(".bk-cover > img")["src"])

        # Author
        book_source.author_name = context.session.find(".product-author-share > a.author:first-child").text

        # Description
        book_source.description = context.session.find("#product-full-description > div.mainbox2-container")["innerHTML"]

        context.result = book_source
      end
    end
  end
end
