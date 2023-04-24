module Types
  class MutationType < Types::BaseObject
    description "MutationType"

    #################### CONSOLE ##########################
    field :consoles_sign_in, mutation: ::Mutations::Consoles::Auths::SignIn, description: "Sign In"
  end
end
