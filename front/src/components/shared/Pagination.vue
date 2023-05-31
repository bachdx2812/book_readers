<template>
  <nav class="flex items-center justify-center mt-4">
    <ul class="pagination">
      <li :class="{ disabled: currentPage === 1 }">
        <button
          class="pagination-link"
          @click="changePage(currentPage - 1)"
          :disabled="currentPage === 1"
        >
          Previous
        </button>
      </li>

      <li v-for="page in pageCount" :key="page">
        <button
          class="pagination-link"
          @click="changePage(page)"
          :disabled="currentPage === page"
          :class="{ 'is-current': currentPage === page }"
        >
          {{ page }}
        </button>
      </li>

      <li :class="{ disabled: currentPage === pageCount }">
        <button
          class="pagination-link"
          @click="changePage(currentPage + 1)"
          :disabled="currentPage === pageCount"
        >
          Next
        </button>
      </li>
    </ul>
  </nav>
</template>

<script>
import { computed } from "vue";

export default {
  props: {
    metaData: {
      type: Object,
      required: true,
    },

    changePage: {
      type: Function,
      required: true,
    },
  },
  setup(props) {
    const currentPage = computed(() => {
      return props.metaData.page;
    });

    const pageCount = computed(() => {
      return props.metaData.pages;
    });

    return {
      currentPage,
      pageCount,
    };
  },
};
</script>

<style>
.pagination {
  display: flex;
  list-style: none;
  gap: 0.5rem;
}

.pagination-link {
  padding: 0.5rem 1rem;
  border: 1px solid #ddd;
  border-radius: 0.25rem;
  background-color: #fff;
  cursor: pointer;
}

.is-current {
  background-color: #007acc;
  color: #fff;
}
</style>
