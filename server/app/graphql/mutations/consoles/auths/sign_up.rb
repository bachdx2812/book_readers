module Mutations
  module Consoles
    module Auths
      class SignUp < BaseMutation
        argument :input, ::Types::Arguments::SignUpInput, required: false, description: "Sign Up Input"

        field :message, String, null: true, description: "Message"

        def resolve(input:)
          form = ::Consoles::SignUpForm.new.assign_model(::User.new, input.to_h)
          if form.save
            {
              message: "success",
            }
          else
            {
              message: "Subscription failed",
            }
          end
        end
      end
    end
  end
end
