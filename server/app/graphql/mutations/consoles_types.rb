module Mutations
  module ConsolesTypes
    extend ActiveSupport::Concern

    included do
      field :consoles_sign_in, mutation: ::Mutations::Consoles::Auths::SignIn, description: "Console Sign In"
    end
  end
end
