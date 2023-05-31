<template>
  <div>
    <h1 class="text-2xl font-bold mb-4">Book Collection</h1>
    <div class="grid grid-cols-2 gap-4">
      <BookCard v-for="book in books" :key="book.id" :book="book" />
    </div>
    <Pagination :changePage="changePage" :metaData="metaData" />
  </div>
</template>

<script>
import BookCard from "@/components/books/BookCard.vue";
import Pagination from "@/components/shared/Pagination.vue";
import { onMounted, computed, ref } from "vue";
import { useBooksStore } from "@/stores/book/index.js";

export default {
  components: {
    BookCard,
    Pagination,
  },
  setup() {
    const booksStore = useBooksStore();

    const books = computed(() => booksStore.books);

    const metaData = computed(() => booksStore.metaData);

    const changePage = (page) => {
      booksStore.setQuery({ page: page });
    };

    onMounted(() => {
      booksStore.fetchBooks();
    });

    return { books, changePage, metaData };
  },
};
</script>
