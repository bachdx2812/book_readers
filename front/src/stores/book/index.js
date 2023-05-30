import { defineStore } from "pinia";
import { ref, computed } from "vue";
import { gqlQuery, fetch } from "@/ultilities/gqlFunc";
import { getBooksList } from "@/apis/resolvers/books";

export const useBooksStore = defineStore("books", () => {
  const variables = ref();

  const fetchBooksList = gqlQuery(getBooksList, variables);

  const books = computed(
    () => fetchBooksList.result?.value?.frontsBooks.collection ?? []
  );

  function fetchBooks(params) {
    variables.value = params;
    fetch(fetchBooksList.load());
  }

  return {
    fetchBooks,
    books,
  };
});
