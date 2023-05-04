import { createApp, provide, h } from "vue";

import { DefaultApolloClient } from "@vue/apollo-composable";
import { apolloClient } from "@/apollo-client";

import { createWebHistory } from "vue-router";

import { createPinia } from "pinia";

import createRouter from "./router.js";
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

app.mount("#app");
