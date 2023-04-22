module Consoles
  module Auths
    class AuthenticationService
      include Interactor

      def call
        user = ::User.find_by(email: context.email)
        return context.fail!(message: "User Not Found") unless user

        return context.fail!(message: "Invalid Username or password") unless user.valid_password?(context.password)

        context.user = user
      end
    end
  end
end
