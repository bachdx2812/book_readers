import { useMutation } from "@vue/apollo-composable";

import { useGlobalStore } from "@/stores/global";

export function gqlMutate(gql, gqlOptions = {}) {
  return useMutation(gql, {
    ...gqlOptions,
    fetchPolicy: "no-cache",
  });
}

export function mutate(mutateFunc, options = { loading: true, toast: true }) {
  const globalStore = useGlobalStore();

  globalStore.setLoading(options?.loading);
  globalStore.setToast(options?.toast);

  return mutateFunc;
}
