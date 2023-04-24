import { ApolloClient, InMemoryCache, HttpLink, from  } from '@apollo/client';
import { onError } from "@apollo/client/link/error";

import { get } from "lodash";

import { store } from "@/store";
import { clearToken } from "@/slices/authSlice";

const httpLink = new HttpLink({
  uri: process.env.NEXT_PUBLIC_API_ENDPOINT
});

const errorLink = onError(
  (e) => errorHandler(e)
);

const AUTHENTICATION_ERROR = "AUTHENTICATION_ERROR";
const AUTHORIZATION_ERROR = "AUTHORIZATION_ERROR";
const NOT_FOUND_ERROR = "NOT_FOUND_ERROR";
const INTERNAL_SERVER_ERROR = "INTERNAL_SERVER_ERROR";
const USER_INPUT_ERROR = "unprocessable_entity";
const UNAUTHENTICATED_EXCEPTION_TYPE = "unauthenticated";
const UNAUTHORIZED_EXCEPTION_TYPE = "unauthorized";

const errorHandler = (error: any) => {
  const { graphQLErrors, networkError } = error;

  if (networkError) {
    switch (networkError.statusCode) {
      case 401:
        // ctx.store.dispatch("auth/setToken", null);
        // ctx.app.router.push("/login");
        console.log("401, need to login")
        return;
      case 403:
        // ctx.app.router.push("/");
        console.log("403, need to go to homepage")
        return;
    }
  }

  // Fetch error messages details
  const errMessages = get(error, "response.errors[0].errors");

  if (graphQLErrors) {
    graphQLErrors.forEach((error: any) => {
      const { status, message, exception_type } = error;

      if (exception_type === UNAUTHENTICATED_EXCEPTION_TYPE) {
        // ctx.store.dispatch("auth/setToken", null);
        // ctx.app.router.push("/login");
        // ctx.app.$toast.error(message);
        console.log("invalid token, need to redirect to login")
        return;
      }

      if (exception_type === UNAUTHORIZED_EXCEPTION_TYPE) {
        // ctx.app.router.push("/");
        // ctx.app.$toast.error(message);
        console.log("Unauthorized for action");
        return;
      }

      // if (ctx.app.$toast) ctx.app.$toast.error(message);
      console.log(status);
      switch (status) {
        case AUTHENTICATION_ERROR:
          break;
        case AUTHORIZATION_ERROR:
          // ctx.error({
          //   statusCode: 403,
          //   message,
          // });
          console.log(`403: ${message}`)
          break;
        case NOT_FOUND_ERROR:
          // ctx.error({
          //   statusCode: 404,
          //   message,
          // });
          console.log(`404: ${message}`)
          break;
        case INTERNAL_SERVER_ERROR:
          // ctx.error({
          //   statusCode: 500,
          //   message,
          // });
          console.log(`500: ${message}`)
          break;
        case USER_INPUT_ERROR:
          // ctx.store.dispatch("global/setValidationErrors", errMessages);
          // need to dispatch global validation error
          console.log("user input error:", errMessages);
          break;
        default:
          break;
      }
    });
  }
};

export const client = new ApolloClient({
  link: from([errorLink, httpLink]),
  cache: new InMemoryCache(),
});