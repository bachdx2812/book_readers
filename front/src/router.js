import { createRouter } from "vue-router";
import HomePage from "@/pages/HomePage.vue";
import SignIn from "@/pages/auths/SignIn.vue";

const routes = [
  {
    path: "/",
    component: HomePage,
  },
  {
    path: "/signIn",
    component: SignIn,
  },
];

export default function (history) {
  return createRouter({
    history,
    routes,
  });
}
