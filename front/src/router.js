import { createRouter } from "vue-router";
import HomePage from "@/pages/HomePage.vue";
import SignIn from "@/pages/auths/SignIn.vue";
import Books from "@/pages/Books/Index.vue";

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
    path: "/books",
    component: Books,
  },
];

export default function (history) {
  return createRouter({
    history,
    routes,
  });
}
