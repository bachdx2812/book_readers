<script setup>
import NavBar from "@/components/layouts/NavBar.vue";
import SideBar from "@/components/layouts/SideBar.vue";

</script>

<template>
  <div>
    <NavBar></NavBar>

    <div class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
      <div class="flex flex-wrap -mx-4">
        <div class="w-full lg:w-1/4 px-4">
          <SideBar></SideBar>
        </div>

        <div class="w-full lg:w-3/4 px-4">
          <h1 class="text-2xl font-bold mb-4">Welcome to my blog</h1>
          <div class="bg-white shadow overflow-hidden sm:rounded-md">
            <slot></slot>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>