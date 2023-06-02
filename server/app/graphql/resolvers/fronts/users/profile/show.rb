module Resolvers
  module Fronts
    module Users
      module Profile
        class Show < ::Resolvers::Base
          graphql_name "FrontsUsersShow"
          description "FrontsUsersShow"

          type ::Types::Payloads::Fronts::Users::ProfileType, null: true

          def resolve 
            Current.user 
          end

          def ready?(**_args)
            authenticate!(:user)
          end
        end
      end
    end
  end
end
