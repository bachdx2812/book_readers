import gql from "graphql-tag";

export const fetchUser = gql`
mutation($input: ProfileInput) {
  profileUpdate(input : $input) {
      message
      profile {
          firstName
          lastName
          phone
          address
      }
  }
}
`;