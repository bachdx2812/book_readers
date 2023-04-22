module Types
  class MutationType < Types::BaseObject
    description "MutationType"

    #################### CONSOLE ##########################
    field :console_sign_in, mutation: ::Mutations::Consoles::Auths::SignIn, description: "Sign In"
  end
end
