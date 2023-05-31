import gql from "graphql-tag";

export const getBooksList = gql`
  query ($input: PagyInput!) {
    frontsBooks(input: $input) {
      collection {
        id
        title
        author
        imageUrl
        description
      }
      metadata
    }
  }
`;
