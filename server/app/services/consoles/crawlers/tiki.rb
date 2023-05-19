# Input:
## url: String
#### https://tiki.vn/den-starbucks-mua-ca-phe-coc-lon-p720128.html
# Ouput:
## result: BookSource

module Consoles
  module Crawlers
    class Tiki < Base
      private

      def crawl
        book_source = BookSource.new

        # Visit URL
        context.session.visit(context.url)

        # Find and get `title`
        book_source.title = context.session.find(".header > .title").text

        # Find and get `images`
        images_div = context.session.find(".review-images__list")
        context.session.all("a > picture").each do |gallery_item|
          book_source.add_image(gallery_item.find("img", visible: :all)["src"]) if gallery_item.has_css?("img", visible: :all)
        end

        # Author
        book_source.author_name = context.session.find(".brand-and-author > h6 > a").text

        # Description
        book_source.description = context.session.find("[class^=\"ToggleContent__View\"]")['innerHTML']

        context.result = book_source
      end
    end
  end
end
