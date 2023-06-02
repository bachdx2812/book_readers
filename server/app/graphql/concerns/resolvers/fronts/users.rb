module Resolvers
  module Fronts
    module Users
      extend ActiveSupport::Concern

      included do
        field :profile_show, resolver: ::Resolvers::Fronts::Users::Profile::Show, description: "Show Profile"
      end
    end
  end
end
