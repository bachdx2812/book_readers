module Types
  class MutationType < Types::BaseObject
    description "MutationType"

    # Sign In
    field :sign_in, mutation: ::Mutations::Auths::SignIn, description: "Sign In"
  end
end
