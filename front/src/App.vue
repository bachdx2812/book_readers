<template>
  <div>
    <Loading></Loading>
    <component :is="layout">
      <router-view></router-view>
    </component>
  </div>
</template>

<script>
import { defineAsyncComponent } from 'vue'
import { storeToRefs } from 'pinia'

import { useAuthStore } from '@/stores/auth';

import Loading from "@/components/shared/Loading.vue";

export default {
  components: {
    DefaultLayout: defineAsyncComponent(() => import('@/layouts/DefaultLayout.vue')),
    AuthLayout: defineAsyncComponent(() => import('@/layouts/AuthLayout.vue')),
    Loading: Loading
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


