<template>
  <div class="button-view">
    <Button label="Save" :loading="isLoading" borderColor="gray" backgroundColor="transparent" textColor="gray" @click="onClick" />
  </div>
</template> 

<script setup>
const isLoading = ref(false);

const onClick = () => {
  isLoading.value = true;
  setTimeout(() => (isLoading.value = false), 3000);
};
</script>

<style lang="css" scoped>
.button-view {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
