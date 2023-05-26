import { defineStore } from "pinia";
import { computed, ref, inject } from "vue";
import { useLocalStorage } from "@vueuse/core";

import { useRouter } from "vue-router";

import { SignInMutation } from "@/apis/mutations";

import { mutate, gqlMutate } from "@/ultilities/gqlFunc";

export const useAuthStore = defineStore("auth", () => {
  const { mutate: signIn } = gqlMutate(SignInMutation);

  const router = useRouter();

  // ================ STATES ==========================
  const token = ref(useLocalStorage("authToken", null));

  // ================ GETTERS ========================
  const layout = computed(() => (token.value ? "DefaultLayout" : "AuthLayout"));

  // ================ ACTIONS ========================
  function setToken(tokenValue) {
    token.value = tokenValue;
  }

  async function signInAction(email, password) {
    const { data } = await mutate(
      signIn({
        email: email,
        password: password,
      })
    );

    token.value = data.frontsSignIn.token;

    router.push("/");
  }

  return {
    token,
    setToken,
    layout,
    signInAction,
  };
});
