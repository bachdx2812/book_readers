import { ApolloClient, InMemoryCache, HttpLink } from "@apollo/client/core";
import { onError } from "@apollo/client/link/error";
import { setContext } from "@apollo/client/link/context";

import { ApolloLink } from "apollo-link";

import { useAuthStore } from "@/stores/auth";
import { useGlobalStore } from "@/stores/global";

import { get } from "lodash";

import Toastify from "toastify-js";

// Create an http link:
const httpLink = new HttpLink({
  uri: "http://localhost:3000/graphql",
});

const authLink = setContext((_, { headers }) => {
  const authStore = useAuthStore();
  const token = authStore.token;

  return {
    headers: {
      ...headers,
      "Book-Club-Authorization": token ? `Bearer ${token}` : "", // set the Authorization header with the token
    },
  };
});

const helperLink = new ApolloLink((operation, forward) => {
  const globalStore = useGlobalStore();
  const useLoading = globalStore.useLoading;

  // Before the request is called
  operation.setContext(() => {
    if (useLoading) {
      globalStore.setLoading(true);
    }
  });

  // After the request is called
  return forward(operation).map((data) => {
    globalStore.setLoading(false);

    // Toastify({
    //   text: "This is a toast",
    //   duration: 3000,
    //   destination: "https://github.com/apvarun/toastify-js",
    //   newWindow: true,
    //   close: true,
    //   gravity: "top", // `top` or `bottom`
    //   position: "left", // `left`, `center` or `right`
    //   stopOnFocus: true, // Prevents dismissing of toast on hover
    //   style: {
    //     background: "linear-gradient(to right, #00b09b, #96c93d)",
    //   },
    //   onClick: function () {}, // Callback after click
    // }).showToast();

    return data;
  });
});

const errorLink = onError((error) => {
  errorHandler(error);
});

const AUTHORIZATION_ERROR = "unauthorized";
const FORBIDDEN_ERROR = "forbidden";
const NOT_FOUND_ERROR = "NOT_FOUND_ERROR";
const INTERNAL_SERVER_ERROR = "INTERNAL_SERVER_ERROR";
const USER_INPUT_ERROR = "unprocessable_entity";

const UNAUTHENTICATED_EXCEPTION_TYPE = "unauthenticated";
const UNAUTHORIZED_EXCEPTION_TYPE = "unauthorized";

const errorHandler = (error) => {
  const { graphQLErrors, networkError } = error;

  const globalStore = useGlobalStore();

  if (networkError) {
    switch (networkError.statusCode) {
      case 401:
        // ctx.store.dispatch("auth/setToken", null);
        // ctx.app.router.push("/login");
        return;
      case 403:
        // ctx.app.router.push("/");
        return;
    }
  }

  const errMessage = get(error, "response.errors[0].message");

  if (errMessage) {
    globalStore.setErrorMessage(errMessage);
  }

  if (graphQLErrors) {
    graphQLErrors.forEach((error) => {
      const { status, message } = error;

      if (error.exception_type === UNAUTHENTICATED_EXCEPTION_TYPE) {
        // ctx.store.dispatch("auth/setToken", null);
        // ctx.app.router.push("/login");
        // ctx.app.$toast.error(message);
        return;
      }

      if (error.exception_type === UNAUTHORIZED_EXCEPTION_TYPE) {
        // ctx.app.router.push("/");
        // ctx.app.$toast.error(message);
        return;
      }

      // if (ctx.app.$toast) ctx.app.$toast.error(message);

      switch (status) {
        case AUTHORIZATION_ERROR:
          console.log("authorization error");
          break;
        case FORBIDDEN_ERROR:
          // ctx.error({
          //   statusCode: 403,
          //   message,
          // });
          break;
        case NOT_FOUND_ERROR:
          // ctx.error({
          //   statusCode: 404,
          //   message,
          // });
          break;
        case INTERNAL_SERVER_ERROR:
          // ctx.error({
          //   statusCode: 500,
          //   message,
          // });
          break;
        case USER_INPUT_ERROR:
          console.log("user error");
          // ctx.store.dispatch("global/setValidationErrors", errMessages);
          break;
        default:
          break;
      }
    });
  }
};

// Create the apollo client
export const apolloClient = new ApolloClient({
  cache: new InMemoryCache(),
  link: errorLink.concat(helperLink).concat(authLink).concat(httpLink),
});
