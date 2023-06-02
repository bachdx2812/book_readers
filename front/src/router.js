import { createRouter } from "vue-router";
import HomePage from "@/pages/HomePage.vue";
import SignIn from "@/pages/auths/SignIn.vue";
import Register from "@/pages/auths/register.vue"
import { computed } from "vue";

const routes = [
  {
    path: "/",
    component: HomePage,
  },
  {
    path: "/signIn",
    component: SignIn,
  },

  {
    path: "/register",
    component: Register
  }
];

export default function (history) {
  return createRouter({
    history,
    routes,
  });
}
