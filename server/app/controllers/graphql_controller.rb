class GraphqlController < ApplicationController
  include Authenticable

  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      # Query context goes here, for example:
      # current_user: current_user,
    }
    result = ServerSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue JWT::DecodeError, UnauthenticatedError => e
    handle_error(e, status: :unauthorized)
  rescue UnauthorizedError => e
    handle_error(e, status: :forbidden)
  rescue ActiveRecord::RecordNotFound => e
    handle_error(e, status: :not_found)
  rescue ActiveRecord::StaleObjectError => e
    handle_error(e, status: :conflict)
  rescue StandardError, RuntimeError => e # rubocop:disable Lint/ShadowedException
    handle_error(e)
  end

  private

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error(err, status: :internal_server_error)
    logger.error err.message
    logger.error err.backtrace.join("\n")

    render json: {
      errors: [
        {
          message: err.message,
          exception_type: err.respond_to?(:exception_type) ? err.exception_type : nil,
        },
      ], data: {}
    }, status: status
  end
end
