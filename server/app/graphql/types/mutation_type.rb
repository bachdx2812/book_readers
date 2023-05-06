module Types
  class MutationType < Types::BaseObject
    description "MutationType"

    include Mutations::ConsolesTypes
    include Mutations::FrontsTypes
  end
end
