module Types
  module NodeType # rubocop:disable GraphQL/ObjectDescription
    include Types::BaseInterface
    include GraphQL::Types::Relay::NodeBehaviors
  end
end
