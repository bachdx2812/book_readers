module ExecutionError
  extend ActiveSupport::Concern

  private

  def execution_error(message: nil, status: :unprocessable_entity, code: 422, errors: nil)
    message = message.presence || I18n.t("errors.messages.validation_error")
    GraphQL::ExecutionError.new(message, options: { status: status, code: code, errors: errors })
  end
end
