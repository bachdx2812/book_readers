<template>
  <div class="container" :class="{ active: isActive }">
    <div class="form-container sign-up-container">
      <form>
        <h1 class="text-3xl font-bold mb-8">Sign up</h1>
        <GlobalErrorMessage />
        <div class="mt-2">
          <input
            class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            type="email"
            placeholder="Name"
          />
          <input
            v-model="email"
            class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            type="email"
            placeholder="Email"
          />
          <input
            v-model="password"
            class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            type="password"
            placeholder="Password"
          />
          <div class="mt-4">
            <button
              class="login-btn text-white font-bold py-2 px-4 rounded"
              type="button"
            >
              Sign Up
            </button>
          </div>
        </div>
      </form>
    </div>

    <!-- TODO -->
    <div class="form-container sign-in-container">
      <form action="#">
        <h1 class="text-3xl font-bold mb-8">Sign in</h1>
        <GlobalErrorMessage />
        <div class="mt-2">
          <input
            v-model="email"
            class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            type="email"
            placeholder="Email"
          />
          <input
            v-model="password"
            class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            type="password"
            placeholder="Password"
          />
        </div>
        <div class="mb-4 w-full">
          <div class="flex items-center justify-between">
            <div class="flex w-1/3 items-center">
              <input
                v-model="isChecked"
                type="checkbox"
                class="form-checkbox"
              />
              <span class="ml-2 whitespace-nowrap">Remember me</span>
            </div>
            <div class="w-1/2">
              <a class="whitespace-nowrap inline-block forgot-pwd" href="#"
                >Forgot your password?</a
              >
            </div>
          </div>
        </div>
        <button
          class="login-btn text-white font-bold py-2 px-4 rounded"
          type="button"
          @click="login(email, password)"
        >
          Sign in
        </button>
      </form>
    </div>
    <div class="overlay-container">
      <div
        class="overlay bg-cover bg-image bg-cover bg-fixed"
        style="
          background-image: url('https://cdn.discordapp.com/attachments/1094838801895018536/1103054130655797248/bachdx_flat_vector_illustration_depicting_a_group_of_people_rea_055bdfe7-7b34-481f-abf3-0ae1da3f6021.png');
        "
      >
        <div class="overlay-panel overlay-left">
          <h1>Welcome Back!</h1>
          <p>To keep connected with us please login with your personal info</p>
          <button
            class="ghost"
            :class="{ active: isActive }"
            @click="toggleActive"
          >
            Sign In
          </button>
        </div>
        <div class="overlay-panel overlay-right">
          <h1>Hello, Friend!</h1>
          <p>Enter your personal details and start journey with us</p>
          <button
            class="ghost"
            :class="{ active: isActive }"
            @click="toggleActive"
          >
            Sign Up
          </button>
        </div>
      </div>
    </div>
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
    const login = authStore.signInAction;

    const email = ref("");
    const password = ref("");
    const isChecked = ref(false);
    const isActive = ref(false);

    const toggleActive = () => {
      isActive.value = !isActive.value;
    };

    return {
      login,
      email,
      password,
      isChecked,
      isActive,
      toggleActive,
    };
  },
};
</script>

<style scoped>
h1 {
  font-weight: bold;
  margin: 0;
}

h2 {
  text-align: center;
}

p {
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.5px;
  margin: 20px 0 30px;
}

span {
  font-size: 12px;
}

a {
  color: #333;
  font-size: 14px;
  text-decoration: none;
  margin: 15px 0;
}

button {
  border-radius: 20px;
  border: 1px solid #7ad2ac;
  background-image: linear-gradient(
    to left top,
    #7ad2ac,
    #37bfaf,
    #00abb5,
    #0096ba
  );
  color: #ffffff;
  font-size: 12px;
  font-weight: bold;
  padding: 12px 45px;
  letter-spacing: 1px;
  text-transform: uppercase;
  transition: transform 80ms ease-in;
}

button:active {
  transform: scale(0.95);
}

button:focus {
  outline: none;
}

form {
  background-color: #ffffff;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0 50px;
  height: 100%;
  text-align: center;
}

input {
  background-color: #eee;
  border: none;
  padding: 12px 15px;
  margin: 8px 0;
  width: 100%;
}

.container {
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  position: relative;
  overflow: hidden;
  width: 768px;
  max-width: 100%;
  min-height: 480px;
}

.form-container {
  position: absolute;
  top: 0;
  height: 100%;
  transition: all 0.6s ease-in-out;
}

.sign-in-container {
  left: 0;
  width: 50%;
  z-index: 2;
}

.container.active .sign-in-container {
  transform: translateX(100%);
}

.sign-up-container {
  left: 0;
  width: 50%;
  opacity: 0;
  z-index: 1;
}

.container.active .sign-up-container {
  transform: translateX(100%);
  opacity: 1;
  z-index: 5;
  animation: show 0.6s;
}

@keyframes show {
  0%,
  49.99% {
    opacity: 0;
    z-index: 1;
  }

  50%,
  100% {
    opacity: 1;
    z-index: 5;
  }
}

.overlay-container {
  position: absolute;
  top: 0;
  left: 50%;
  width: 50%;
  height: 100%;
  overflow: hidden;
  transition: transform 0.6s ease-in-out;
  z-index: 100;
}

.container.active .overlay-container {
  transform: translateX(-100%);
}

.overlay {
  background: #ff416c;
  background: -webkit-linear-gradient(
    to right,
    #7ad2ac,
    #37bfaf,
    #00abb5,
    #0096ba
  );
  background: linear-gradient(to right, #7ad2ac, #37bfaf, #00abb5, #0096ba);
  opacity: 0.9;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: 0 0;
  color: #ffffff;
  position: relative;
  left: -100%;
  height: 100%;
  width: 200%;
  transform: translateX(0);
  transition: transform 0.6s ease-in-out;
}

.container.active .overlay {
  transform: translateX(50%);
}

.overlay-panel {
  position: absolute;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0 40px;
  text-align: center;
  top: 0;
  height: 100%;
  width: 50%;
  transform: translateX(0);
  transition: transform 0.6s ease-in-out;
}

.overlay-left {
  transform: translateX(-20%);
}

.container.active .overlay-left {
  transform: translateX(0);
}

.overlay-right {
  right: 0;
  transform: translateX(0);
}

.container.active .overlay-right {
  transform: translateX(20%);
}

.social-container {
  margin: 20px 0;
}

.social-container a {
  border: 1px solid #dddddd;
  border-radius: 50%;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  margin: 0 5px;
  height: 40px;
  width: 40px;
}

.login-btn {
  background-color: linear-gradient(
    to right,
    #7ad2ac,
    #37bfaf,
    #00abb5,
    #0096ba
  );
}

.forgot-pwd {
  font-size: 12px;
}
</style>
>
