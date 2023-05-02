import { createApp } from 'vue'
import { createWebHistory } from 'vue-router'

import createRouter from './router.js'
import App from './App.vue'

import './style.css'

const router = createRouter(createWebHistory())

createApp(App).use(router).mount('#app')

