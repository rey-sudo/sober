<template>
  <div class="container-fluid">
    <h1>Sober UI components</h1>

    <div ref="gridRef" class="grid-stack">
      <div class="grid-stack-item" gs-x="0" gs-y="0" gs-w="4" gs-h="2">
        <div class="grid-stack-item-content">
          <ButtonView />
        </div>
      </div>

      <div class="grid-stack-item" gs-x="4" gs-y="0" gs-w="4" gs-h="2">
        <div class="grid-stack-item-content">
          <InputTextView />
        </div>
      </div>

      <div class="grid-stack-item" gs-x="8" gs-y="0" gs-w="4" gs-h="2">
        <div class="grid-stack-item-content">Widget C</div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import { GridStack } from "gridstack";
import "gridstack/dist/gridstack.css";

const gridRef = ref(null);
let grid;

onMounted(() => {
  grid = GridStack.init(
    {
      float: true,
      resizable: { handles: "all" },
    },
    gridRef.value
  );
});
</script>

<style scoped>
.grid-stack-item {
  border: 1px solid gray;
}
</style>
