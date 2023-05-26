module Mutations
  module Fronts
    module Users
      module Profile
        class Update < Base
          argument :input, ::Types::Arguments::Fronts::Users::ProfileInput, required: false
          field :message, String, null: false 
          field :profile, ::Types::Payloads::Fronts::Users::ProfileType, null: true
          def resolve(input: )
            user = Current.user
            if user.update(input.to_h)
              {message:"Cập nhật thành công!", profile: user}
            else 
              {message:"Cập nhật thất bại!"}
            end
          end  
        end
      end
    end
  end
end