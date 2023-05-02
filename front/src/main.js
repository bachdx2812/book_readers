import { createApp } from 'vue'
import { createWebHistory } from 'vue-router'
import { createPinia } from 'pinia'

import createRouter from './router.js'
import App from './App.vue'

import './style.css'

const router = createRouter(createWebHistory())
const pinia = createPinia()

createApp(App).
  use(router).
  use(pinia).
  mount('#app')

