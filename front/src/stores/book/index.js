import { defineStore } from "pinia";
import { ref, computed } from "vue";
import { gqlQuery, fetch } from "@/ultilities/gqlFunc";
import { getBooksList } from "@/apis/resolvers/books";

export const useBooksStore = defineStore("books", () => {
  const query = ref({
    page: 1,
    perPage: 4,
    q: {},
  });

  const variables = ref({ input: query.value });

  const fetchBooksList = gqlQuery(getBooksList, variables);

  const books = computed(
    () => fetchBooksList.result?.value?.frontsBooks.collection ?? []
  );

  const metaData = computed(
    () => fetchBooksList.result?.value?.frontsBooks.metadata ?? {}
  );

  function setQuery(params) {
    Object.assign(query.value, params);
  }

  function fetchBooks() {
    fetch(fetchBooksList.load());
  }

  return {
    fetchBooks,
    books,
    metaData,
    setQuery,
  };
});
