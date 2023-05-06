require "json_web_token"

module Shared
  module Auths
    class GenerateTokenService
      include Interactor

      def call
        token_expired_time = context.remember_me ? 2.weeks.from_now : 7.days.from_now

        context.token = JsonWebToken.encode(context.user.jwt_payload, token_expired_time)
      rescue StandardError => e
        Rails.logger.error("#{self.class.name}, Error: #{e.message}")
        context.fail!(message: "Generate Token Error!, #{e.message}")
      end
    end
  end
end
