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
import { onMounted, computed } from "vue";
import { useBooksStore } from "@/stores/book/index.js";

export default {
  components: {
    BookCard,
  },
  setup() {
    const booksStore = useBooksStore();

    const books = computed(() => booksStore.books);

    onMounted(() => {
      booksStore.fetchBooks({
        input: {},
      });
    });

    return { books };
  },
};
</script>
