import gql from "graphql-tag";

export const fetchUser = gql`
  query {
    profileShow {
      firstName
      lastName
      gender
      phone
      birthday
      email
    }
  }
`;
