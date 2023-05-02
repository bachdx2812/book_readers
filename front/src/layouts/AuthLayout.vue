<template>
  <div>
    <div class="flex flex-col md:flex-row h-screen">
      <div class="bg-white md:w-1/2 flex items-center justify-center">
        <slot></slot>
      </div>
      <div class="bg-cover bg-center md:w-1/2 h-screen"
        style="background-image: url('https://cdn.discordapp.com/attachments/1094838801895018536/1103054130655797248/bachdx_flat_vector_illustration_depicting_a_group_of_people_rea_055bdfe7-7b34-481f-abf3-0ae1da3f6021.png')">
      </div>
    </div>
  </div>
</template>