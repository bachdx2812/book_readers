class BookSource
  attr_accessor :title, :author_name, :images

  def initialize
    @title = ""
    @author_name = ""
    @images = []
  end

  def add_image(image)
    @images.push(image)
  end
end
