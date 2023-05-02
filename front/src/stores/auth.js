import { defineStore } from "pinia";
import { computed, ref } from "vue";
import { useLocalStorage } from "@vueuse/core";

export const useAuthStore = defineStore("auth", () => {
  const token = ref(useLocalStorage("authToken", null));
  const layout = computed(() => (token.value ? "DefaultLayout" : "AuthLayout"));

  function setToken(tokenValue) {
    token.value = tokenValue;
  }

  return { token, setToken, layout };
});
