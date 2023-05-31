import { useMutation, useLazyQuery } from "@vue/apollo-composable";

import { useGlobalStore } from "@/stores/global";

export function gqlMutate(gql, gqlOptions = {}) {
  return useMutation(gql, {
    ...gqlOptions,
    fetchPolicy: "no-cache",
  });
}

export function gqlQuery(gql, gqlOptions = {}) {
  return useLazyQuery(
    gql,
    gqlOptions,

    { fetchPolicy: "cache-and-network" }
  );
}

export function mutate(mutateFunc, options = { loading: true, toast: true }) {
  const globalStore = useGlobalStore();

  globalStore.setLoading(options?.loading);
  globalStore.setToast(options?.toast);

  return mutateFunc;
}

export function fetch(fetchFunc, options = { loading: true, toast: false }) {
  mutate(fetchFunc, options);
}
