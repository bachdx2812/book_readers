module Types
  module Arguments
    module Fronts
      module Users
        class ProfileInput < ::Types::BaseInputObject
          graphql_name "ProfileInput"
          description "ProfileInput"

          argument :first_name, String, required: false, description: "First Name"
          argument :last_name, String, required: false, description: "Last Name"
          argument :phone, String, required: false, description: "Phone number"
          argument :address, String, required: false, description: "Address"
        end
      end
    end
  end
end