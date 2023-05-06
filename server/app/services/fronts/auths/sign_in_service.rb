module Fronts
  module Auths
    class SignInService
      include Interactor::Organizer

      organize Shared::Auths::AuthenticationService,
               Shared::Auths::GenerateTokenService
    end
  end
end
