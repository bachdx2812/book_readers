<template>
  <form class="w-full max-w-md p-8">
    <h2 class="text-2xl font-bold mb-8">Sign In</h2>

    <GlobalErrorMessage />

    <div class="mb-4">
      <label class="block text-gray-700 font-bold mb-2" for="username">
        Username
      </label>
      <input
        v-model="email"
        class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        id="username"
        type="text"
        placeholder="Enter your username"
      />
    </div>
    <div class="mb-6">
      <label class="block text-gray-700 font-bold mb-2" for="password">
        Password
      </label>
      <input
        v-model="password"
        class="appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
        id="password"
        type="password"
        placeholder="Enter your password"
      />
      <p class="text-gray-600 text-xs italic">
        Make it as long and as crazy as you'd like
      </p>
    </div>
    <div class="flex items-center justify-between">
      <button
        class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
        type="button"
        @click="login(email, password)"
      >
        Sign In
      </button>
      <a
        class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800"
        href="#"
      >
        Forgot Password?
      </a>
    </div>
  </form>
</template>

<script>
import { ref } from "vue";

import { useAuthStore } from "@/stores/auth";

import GlobalErrorMessage from "@/components/shared/GlobalErrorMessage.vue";

export default {
  components: {
    GlobalErrorMessage: GlobalErrorMessage,
  },
  setup() {
    const authStore = useAuthStore();
    const login = authStore.signInAction;

    const email = ref("");
    const password = ref("");

    return {
      login,
      email,
      password,
    };
  },
};
</script>
