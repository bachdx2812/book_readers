module Consoles
  module Books
    class CrawlImageService
      include Interactor

      def call
        context.images = []

        context.urls.each do |url|
          image_data = URI.parse(url).open(&:read)

          image = ActiveStorage::Blob.create_and_upload!(
            io: StringIO.new(image_data),
            filename: "image.jpg",
            content_type: "image/jpeg",
          )

          context.images.push(image)
        end

        context.images
      end
    end
  end
end
