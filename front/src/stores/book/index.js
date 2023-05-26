import { defineStore } from "pinia";
import { ref } from "vue";
import { gqlQuery, fetch } from "@/ultilities/gqlFunc";
import { getBooksList } from "@/apis/resolvers/books";

export const useBooksStore = defineStore("books", () => {
  const variables = ref();
  const books = ref([]);

  const fetchBooksList = gqlQuery(getBooksList, variables);

  async function fetchBooks(params) {
    variables.value = params;
    const { data } = await fetch(fetchBooksList.load());
  }

  return {
    fetchBooks,
    books,
  };
});
