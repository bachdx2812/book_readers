module Types
  module Payloads
    module Fronts
      module Users
        class ProfileType < Types::BaseObject
          graphql_name "ProfileType"
          description "ProfileType"

          field :first_name, String, null: true, description: "First name"
          field :last_name, String, null: true, description: "Last name"
          field :phone, String, null: true, description: "Phone number"
          field :address, String, null: true, description: "Address"
          field :email, String, null: true, description: "Email"
          field :gender, String, null: true, description: "Gender"
          field :birthday, String, null: true, description: "Birthday"
        end
      end
    end
  end
end
