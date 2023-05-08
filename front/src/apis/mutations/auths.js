import gql from "graphql-tag";

export const SignInMutation = gql`
  mutation ($email: String!, $password: String!, $rememberMe: Boolean) {
    frontsSignIn(email: $email, password: $password, rememberMe: $rememberMe) {
      token
      message
    }
  }
`;
