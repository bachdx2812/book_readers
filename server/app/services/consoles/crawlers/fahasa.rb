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

        context.session.visit(context.url)

        main_infos_div = context.session.find(".product-essential")

        book_source.title = main_infos_div.find("h1").text

        main_infos_div.all(".include-in-gallery", visible: :all).each do |gallery_item|
          book_source.add_image(gallery_item.find("img", visible: :all)["src"]) if gallery_item.has_css?("img", visible: :all)
        end

        infos_div = context.session.find("#product_view_info")

        book_source.author_name = infos_div.find(".data_author").text

        context.result = book_source
      end
    end
  end
end
