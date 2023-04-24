module Types
  module Payloads
    class SignInType < Types::BaseObject
      graphql_name "SignInType"
      description "SignInType"

      field :token, String, null: true, description: "Authencity Token"
    end
  end
end
