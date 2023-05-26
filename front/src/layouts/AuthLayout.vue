<template>
  <div>
    <div
      class="h-screen"
      style="
        background-image: linear-gradient(
          to right bottom,
          #7ad2ac,
          #37bfaf,
          #00abb5,
          #0096ba
        );
      "
    >
      <div class="h-screen flex items-center justify-center">
        <slot></slot>
      </div>
    </div>
  </div>
</template>
