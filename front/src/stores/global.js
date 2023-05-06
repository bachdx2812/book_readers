import { ref } from "vue";
import { defineStore } from "pinia";
import { get } from "lodash";

export const useGlobalStore = defineStore("global", () => {
  const validationErrors = ref({});
  const errorMessage = ref("");

  function getErrors(name) {
    return get(validationErrors, name, []);
  }

  function setErrorMessage(message) {
    errorMessage.value = message;
  }

  return {
    errorMessage,
    getErrors,
    setErrorMessage,
  };
});
