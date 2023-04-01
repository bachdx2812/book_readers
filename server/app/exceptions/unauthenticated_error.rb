class UnauthenticatedError < StandardError
  attr_accessor :exception_type

  def initialize(message = I18n.t("devise.failure.unauthenticated"), exception_type = "unauthenticated")
    @exception_type = exception_type
    super(message)
  end
end
