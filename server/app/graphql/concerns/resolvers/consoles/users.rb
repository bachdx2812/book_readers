module Resolvers 
  module Consoles
    module Users
      extend ActiveSupport::Concern

      included do
        field :consoles_users, resolver: ::Resolvers::Consoles::Users::Index, description: "Consoles Users List"
      end
    end
  end
end
