import { defineStore } from "pinia";
import { computed } from "vue";

export const useAuthStore = defineStore("auth", () => {
  const token = "";
  const layout = computed(() => (token ? "DefaultLayout" : "AuthLayout"));

  function setToken(tokenValue) {
    token.value = tokenValue;
  }

  return { setToken, layout };
});
