module Types
  module Arguments
    class PagyInput < ::Types::BaseInputObject
      graphql_name "PagyInput"
      description "PagyInput"

      argument :page, Integer, required: false, description: "Current Page"
      argument :per_page, Integer, required: false, description: "Number of Item Per Page"
      argument :q, Types::BaseScalar, required: false, description: "Ransack Query"
    end
  end
end
