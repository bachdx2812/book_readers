import { createApp, h } from "vue";

import { DefaultApolloClient } from "@vue/apollo-composable";
import { apolloClient } from "@/apis/apollo-client";

import { createWebHistory } from "vue-router";
import createRouter from "./router.js";

import { createPinia } from "pinia";

import Toastify from "toastify-js";
import "toastify-js/src/toastify.css";

import App from "./App.vue";

import "./style.css";

const router = createRouter(createWebHistory());

const pinia = createPinia();

const app = createApp({
  render: () => h(App),
});

app.use(router);
app.use(pinia);
// must provide after Pinia store to be able to use store data
app.provide(DefaultApolloClient, apolloClient);

app.provide("$toast", Toastify);
app.mount("#app");
