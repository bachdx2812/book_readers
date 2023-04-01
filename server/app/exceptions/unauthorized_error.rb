class UnauthorizedError < StandardError
  def initialize(message = I18n.t("devise.failure.unauthorized"))
    super
  end
end
