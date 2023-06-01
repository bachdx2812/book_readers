<template>
  <div class="card">
    <form class="w-full max-w-md p-8">
      <h2 class="text-2xl font-bold mb-8">Sign Up</h2>
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
      </div>
      <div class="mb-6">
        <label class="block text-gray-700 font-bold mb-2" for="password">
          Gender
        </label>
        <input
          v-model="gender"
          class="appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
          id="password"
          type="number"
        />
      </div>
      <div class="mb-6">
        <label class="block text-gray-700 font-bold mb-2" for="password">
          BirthDay
        </label>
        <input
          v-model="birthday"
          class="appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
          type="text"
        />
      </div>
      <div class="flex items-center justify-between">
        <button
          class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
          type="button"
          @click="register(email, password, birthday, gender )"
        >
          Sign Up
        </button>
      </div>
    </form>
  </div>
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
    const register = authStore.SignUp;

    const email = ref("");
    const password = ref("");
    const gender = ref("");
    const birthday = ref("");

    async function SignUp() {
const params = authStore.SignUp({
  email: email, password:

});
    }

    return {
      register,
      email,
      gender,
      birthday,
      password,
    };
  },
};
</script>
