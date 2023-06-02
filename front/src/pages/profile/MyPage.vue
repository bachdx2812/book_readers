<template>
  <div
    v-if="profile"
    class="w-3/5 flex items-center h-auto lg:h-screen flex-wrap flex-row-reverse mx-auto my-32 lg:my-0"
  >
    <div
      id="profile"
      class="w-full lg:w-3/5 rounded-lg lg:rounded-l-lg lg:rounded-r-none shadow-2xl bg-white mx-6 lg:mx-0"
    >
      <div class="p-4 md:p-12 text-center lg:text-left">
        <div
          class="avatar-frame block lg:hidden rounded-full shadow-xl mx-auto -mt-16 h-48 w-48 bg-cover bg-center"
        ></div>

        <div class="flex justify-center gap-3">
          <h1 class="text-lg font-bold pt-8 lg:pt-0">
            {{ profile.firstName }}
          </h1>
          <h1 class="text-lg font-bold pt-8 lg:pt-0">{{ profile.lastName }}</h1>
        </div>
        <div
          class="mx-auto lg:mx-0 w-4/5 pt-3 border-b-2 border-green-500 opacity-25"
        ></div>
        <p
          class="pt-4 text-base font-bold flex items-center justify-center lg:justify-start"
        >
          {{ profile.email }}
        </p>
        <p class="pt-2 text-sm">{{ profile.gender }}</p>
        <p class="pt-2 text-sm">{{ profile.phone }}</p>
        <p class="pt-2 text-sm">{{ profile.birthday }}</p>
        <p class="pt-2 text-sm">{{ profile.gender }}</p>

        <div class="pt-12 pb-8">
          <button
            class="bg-green-700 hover:bg-green-900 text-white font-bold py-2 px-4 rounded-full"
          >
            Edit Profile
          </button>
        </div>
      </div>
    </div>

    <div class="w-full h-auto lg:w-2/5">
      <img
        src="public/images/avatar.png"
        class="h-full rounded-none lg:rounded-lg shadow-2xl hidden lg:block"
      />
    </div>
  </div>
</template>
<script>
import { computed } from "vue";
import { onMounted } from "vue";
import { useQuery } from "@vue/apollo-composable";
import { fetchUser } from "@/apis/resolvers/user";

export default {
  setup() {
    const { result } = useQuery(fetchUser);
    const profile = computed(() => result.value?.profileShow);
    onMounted(() => {
      console.log(profile);
    });
    return { profile, onMounted };
  },
};
</script>

<style lang="css" scoped>
.avatar-frame {
  background-image: url("public/images/avatar.png");
}
</style>
