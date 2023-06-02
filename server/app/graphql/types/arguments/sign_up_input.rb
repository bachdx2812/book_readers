module Types
  module Arguments
    class SignUpInput < ::Types::BaseInputObject
      graphql_name "SignUpInput"
      description "SignUpInput"

      argument :email, String, required: false, description: "email"
      argument :password, String, required: false, description: "password"
      # argument :password_confirm, String, null: false, description: "Password "
      argument :birthday, String, required: false, description: "birthday"
      argument :gender, Integer, required: false, description: "gender"
    end
  end
end
