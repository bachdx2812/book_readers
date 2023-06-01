module Mutations
  module ConsolesTypes
    extend ActiveSupport::Concern

    included do
      field :consoles_sign_in, mutation: ::Mutations::Consoles::Auths::SignIn, description: "Console Sign In"
      field :sign_up, mutation: ::Mutations::Consoles::Auths::SignUp, description: "Sign Up"
    end
  end
end
