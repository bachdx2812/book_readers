import { defineStore } from "pinia";
import { computed, ref } from "vue";

export const useAuthStore = defineStore("auth", () => {
  const token = ref("");
  const layout = computed(() =>
    token.value !== "" ? "DefaultLayout" : "AuthLayout"
  );

  function setToken(tokenValue) {
    token.value = tokenValue;
  }

  return { token, setToken, layout };
});
