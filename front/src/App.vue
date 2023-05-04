<template>
  <component :is="layout">
    {{ layout }}
    <router-view></router-view>
  </component>
</template>

<script>
import { defineAsyncComponent } from 'vue'
import { storeToRefs } from 'pinia'

import { useAuthStore } from '@/stores/auth';

export default {
  components: {
    DefaultLayout: defineAsyncComponent(() => import('@/layouts/DefaultLayout.vue')),
    AuthLayout: defineAsyncComponent(() => import('@/layouts/AuthLayout.vue'))
  },

  setup() {
    const authStore = useAuthStore();
    const { layout } = storeToRefs(authStore);

    return {
      layout
    }
  },
}

</script>


