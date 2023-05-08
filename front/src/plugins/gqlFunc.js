import { useMutation } from "@vue/apollo-composable";

import { useGlobalStore } from "@/stores/global";

export function gqlMutate(
  gql,
  gqlOptions = {},
  options = { loading: false, toast: false }
) {
  const globalStore = useGlobalStore();

  globalStore.setUseLoading(options?.loading || false);

  return useMutation(gql, {
    ...gqlOptions,
    fetchPolicy: "no-cache",
  });
}
