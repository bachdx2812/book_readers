<template>
  <div class="bg-white rounded-lg shadow-lg">
    <img :src="book.imageUrl" :alt="book.title" class="rounded-t-lg" />
    <div class="p-4">
      <h2 class="text-xl font-bold mb-2">{{ book.title }}</h2>
      <p class="text-gray-600">{{ book.author }}</p>
      <p class="text-gray-800 mt-4">{{ book.description }}</p>
      <div class="flex justify-center mt-4">
        <button
          @click="readMore"
          class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600"
        >
          Read
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import { useRouter } from "vue-router";

export default {
  props: {
    book: {
      type: Object,
      required: true,
    },
  },
  setup(props) {
    const router = useRouter();
    const readMore = () => {
      router.push(`/books/${props.book.slug}`);
    };

    return {
      readMore,
    };
  },
};
</script>

<style scoped></style>
