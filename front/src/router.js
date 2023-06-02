import { createRouter } from "vue-router";
import HomePage from "@/pages/HomePage.vue";
import SignIn from "@/pages/auths/SignIn.vue";
import MyPage from "@/pages/profile/MyPage.vue";

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
    path: "/mypage",
    component: MyPage,
  }
];

export default function (history) {
  return createRouter({
    history,
    routes,
  });
}
