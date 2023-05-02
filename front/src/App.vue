<script>
import { defineAsyncComponent, ref } from 'vue'

import { useAuthStore } from '@/stores/auth';

export default {
  components: {
    DefaultLayout: defineAsyncComponent(() => import('@/layouts/DefaultLayout.vue')),
    AuthLayout: defineAsyncComponent(() => import('@/layouts/AuthLayout.vue'))
  },

  setup() {
    const { layout } = useAuthStore();

    return {
      layout
    }
  },

  mounted() {
  }
}

</script>

<template>
  <component :is="layout">
    <router-view></router-view>
  </component>
</template>

