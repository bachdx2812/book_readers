<script>
import { defineAsyncComponent } from 'vue'

import { ref } from 'vue'

export default {
  components: {
    DefaultLayout: defineAsyncComponent(() => import('@/layouts/DefaultLayout.vue')),
    AuthLayout: defineAsyncComponent(() => import('@/layouts/AuthLayout.vue'))
  },

  setup() {
    const layout = ref("");

    layout.value = "DefaultLayout";

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

