module Auths
  class SignInService
    include Interactor::Organizer

    organize AuthenticationService, GenerateTokenService
  end
end
