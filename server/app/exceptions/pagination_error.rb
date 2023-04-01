class PaginationError < StandardError
  attr_accessor :exception_type

  def initialize(msg = "Number of pages is overflow", exception_type = "paging_overflow")
    @exception_type = exception_type
    super(msg)
  end
end
