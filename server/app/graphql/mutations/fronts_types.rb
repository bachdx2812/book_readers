module Mutations
  module FrontsTypes
    extend ActiveSupport::Concern

    included do
      field :fronts_sign_in, mutation: ::Mutations::Fronts::Auths::SignIn, description: "Front Sign In"
    end
  end
end
