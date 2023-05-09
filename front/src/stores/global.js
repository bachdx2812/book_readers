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

  function setUseLoading(value) {
    useLoading.value = value;
  }

  function setLoading(value) {
    loading.value = value;

    if (!value) {
      useLoading.value = false;
    }
  }

  function setUseToast(value) {
    useToast.value = value;
  }

  function setToast(value) {
    toast.value = value;

    if (!value) {
      useToast.value = false;
    }
  }

  return {
    // Errors Msgs
    errorMessage,
    getErrors,
    setErrorMessage,
    // Loading
    useLoading,
    loading,
    setUseLoading,
    setLoading,
    // Toast
    useToast,
    toast,
    setUseToast,
    setToast,
  };
});
