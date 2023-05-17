# Input:
## url: String
#### https://www.fahasa.com/hieu-ve-trai-tim-tai-ban-2023.html
# Ouput:
## result: BookSource

module Consoles
  module Crawlers
    class Fahasa < Base
      private

      def crawl
        book_source = BookSource.new

        # Visit URL
        context.session.visit(context.url)

        # Find and get `title`
        main_infos_div = context.session.find(".product-essential")
        book_source.title = main_infos_div.find("h1").text

        # Find and get `images`
        main_infos_div.all(".include-in-gallery", visible: :all).each do |gallery_item|
          book_source.add_image(gallery_item.find("img", visible: :all)["src"]) if gallery_item.has_css?("img", visible: :all)
        end

        # Find and get `author` & `description`
        infos_div = context.session.find("#product_view_info")
        book_source.author_name = infos_div.find(".data_author").text

        context.result = book_source
      end
    end
  end
end
