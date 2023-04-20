module Auths
  class AuthenticationService
    include Interactor

    def call
      user_group = UserGroup.enabled.find_by(group_code: context.group_code)
      return context.fail!(message: "User Group Not Found") unless user_group

      user = user_group.users.enabled.find_by(login: context.login_key)
      return context.fail!(message: "User Not Found") unless user

      return context.fail!(message: "Invalid Username or password") unless user.valid_password?(context.password)

      context.user = user
    end
  end
end
