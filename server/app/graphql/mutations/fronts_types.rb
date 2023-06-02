module Mutations
  module FrontsTypes
    extend ActiveSupport::Concern

    included do
      field :fronts_sign_in, mutation: ::Mutations::Fronts::Auths::SignIn, description: "Front Sign In"
      field :profile_update, mutation: ::Mutations::Fronts::Users::Profile::Update, description: "Update Profile"
    end
  end
end
