<template>
  <div class="layout">
    <main class="content">
      <NuxtPage :key="$route.fullPath" />
    </main>
  </div>
</template>

<script setup>


</script>

<style scoped>
.layout {
  width: 100%;
  height: 100vh;
  box-sizing: border-box;
}

.content {
  flex: 1;
}
</style>