import { defineStore } from "pinia";
import { get } from "lodash";

export const useGlobalStore = defineStore("global", () => {
  const validationErrors = ref({});
  const errorMessage = ref("");

  function getErrors(name) {
    return get(validationErrors, name, []);
  }

  return { errorMessage, getErrors };
});
