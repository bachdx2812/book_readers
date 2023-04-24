import { gql } from '@apollo/client';

export const ConsolesSignIn = gql`
  mutation ($email: String!, $password: String!, $rememberMe: Boolean!) {
    consolesSignIn(
      email: $email,
      password: $password,
      rememberMe: $rememberMe
    ) {
      token
      message
    }
  }
`;