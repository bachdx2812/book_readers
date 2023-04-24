module Mutations
  module Consoles
    module Auths
      class SignIn < BaseMutation
        graphql_name "AuthsSignIn"
        description "AuthsSignIn"

        argument :email, String, required: true, description: "Login Key"
        argument :password, String, required: true, description: "Password"
        argument :remember_me, Boolean, required: false, description: "Remember Me"

        type ::Types::Payloads::SignInType
        field :message, String, null: true, description: "Sign In Message"

        def resolve(email:, password:, remember_me:)
          result = ::Consoles::Auths::SignInService.call(
            email:,
            password:,
            remember_me:,
          )

          if result.success?
            {
              token: result.token,
              message: I18n.t("devise.sessions.signed_in"),
            }
          else
            execution_error(message: result.message, status: :unauthorized, code: 401)
          end
        end
      end
    end
  end
end
