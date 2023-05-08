import { ref } from "vue";

import { defineStore } from "pinia";
import { get } from "lodash";

export const useGlobalStore = defineStore("global", () => {
  const validationErrors = ref({});
  const errorMessage = ref("");
  const loading = ref(false);

  function getErrors(name) {
    return get(validationErrors, name, []);
  }

  function setErrorMessage(message) {
    errorMessage.value = message;
  }

  function setLoading(loading) {
    loading.value = loading;
  }

  return {
    errorMessage,
    getErrors,
    setErrorMessage,
    loading,
    setLoading,
  };
});
