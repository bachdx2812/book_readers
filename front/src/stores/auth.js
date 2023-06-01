import { defineStore } from "pinia";
import { computed, ref, inject } from "vue";
import { useLocalStorage } from "@vueuse/core";

import { useRouter } from "vue-router";

import { SignInMutation, Register } from "@/apis/mutations";

import { mutate, gqlMutate } from "@/ultilities/gqlFunc";

export const useAuthStore = defineStore("auth", () => {
  const { mutate: signIn } = gqlMutate(SignInMutation);
  const {mutate : register} = gqlMutate(Register)

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

    token.value = data.signIn.token;

    router.push("/");
  }

  async function SignUp(email ,password, birthday ,gender) {
    const resgisterUser = await mutate(
      register({
        input: {
          email: email,
          password: password,
          birthday: birthday,
          gender: gender,
       
        }
      })
    )
    return resgisterUser
  }

  return {
    token,
    setToken,
    layout,
    signInAction,
    SignUp
  };
});
