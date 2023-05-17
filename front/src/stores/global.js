import { ref } from "vue";

import { defineStore } from "pinia";
import { get } from "lodash";

export const useGlobalStore = defineStore("global", () => {
  const validationErrors = ref({});
  const errorMessage = ref("");

  const useLoading = ref(false);
  const loading = ref(false);

  const useToast = ref(false);
  const toast = ref(false);

  function getErrors(name) {
    return get(validationErrors, name, []);
  }

  function setErrorMessage(message) {
    errorMessage.value = message;
  }

  function setLoading(value) {
    loading.value = value;
  }

  function setToast(value) {
    toast.value = value;
  }

  return {
    // Errors Msgs
    errorMessage,
    getErrors,
    setErrorMessage,
    // Loading
    loading,
    setLoading,
    // Toast
    toast,
    setToast,
  };
});
