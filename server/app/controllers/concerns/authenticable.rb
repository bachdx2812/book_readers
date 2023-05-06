require "json_web_token"

BEARER_AUTHORIZATION = "Bearer"
HEADER = "Book-Club-Authorization"

module Authenticable
  private

  def current_user
    return nil unless token

    begin
      decoded = JsonWebToken.decode(token)

      return User.find_by!(id: decoded[:sub], secret_jwt_key: decoded[:secret_jwt_key])
    rescue StandardError => _e
      return nil
    end
  end

  def token
    authen, token = request.headers[HEADER].to_s.split(" ")
    return unless authen == BEARER_AUTHORIZATION

    token
  end
end
