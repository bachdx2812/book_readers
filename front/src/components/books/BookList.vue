<template>
  <div>
    <h1 class="text-2xl font-bold mb-4">Book Collection</h1>
    <div class="grid grid-cols-2 gap-4">
      <BookCard v-for="book in books" :key="book.id" :book="book" />
    </div>
  </div>
</template>

<script>
import BookCard from "./BookCard.vue";

import { computed } from "vue";
import { useQuery } from "@vue/apollo-composable";
import { getBooksList } from "@/apis/resolvers/books";

export default {
  components: {
    BookCard,
  },
  setup() {
    const { result } = useQuery(getBooksList, { input: {} });
    const books = computed(() => result.value?.frontsBooks?.collection);

    return { books };
  },
};
</script>

<style></style>
