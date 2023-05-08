import { defineStore } from "pinia";
import { computed, ref, inject } from "vue";
import { useLocalStorage } from "@vueuse/core";

import { useRouter } from "vue-router";

import { SignInMutation } from "@/apis/mutations";

import { gqlMutate } from "@/plugins/gqlFunc";

export const useAuthStore = defineStore("auth", () => {
  const { mutate: signIn } = gqlMutate(
    SignInMutation,
    {},
    {
      loading: true,
    }
  );

  const router = useRouter();

  // ================ STATES ==========================
  const token = ref(useLocalStorage("authToken", null));

  // ================ GETTERS ========================
  const layout = computed(() => (token.value ? "DefaultLayout" : "AuthLayout"));

  // ================ ACTIONS ========================
  function setToken(tokenValue) {
    token.value = tokenValue;
  }

  function signInAction(email, password) {
    signIn({
      email: email,
      password: password,
    }).then(({ data }) => {
      token.value = data.frontsSignIn.token;

      router.push("/");
    });
  }

  return {
    token,
    setToken,
    layout,
    signInAction,
  };
});
