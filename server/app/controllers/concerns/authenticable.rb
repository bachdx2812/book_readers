require "json_web_token"

BEARER_AUTHORIZATION = "Bearer"

module Authenticable
  private

  def current_user
    return nil unless token

    begin
      decoded = JsonWebToken.decode(token)

      User.find(decoded[:sub])
    rescue StandardError => _e
      return nil
    end

    user
  end

  def token
    authen, token = request.headers["Behemoth-Universal-Authorization"].to_s.split(" ")
    return unless authen == BEARER_AUTHORIZATION

    token
  end
end
