<template>
  <div class="container-fluid">
    <h1>Sober</h1>
    <div>
      <a class="btn btn-primary" href="#" id="float" @click.prevent="toggleFloat">
        float: {{ isFloat }}
      </a>
    </div>
    <br><br>

    <!-- Widgets manuales -->
    <div ref="gridRef" class="grid-stack">
      <div class="grid-stack-item" gs-x="0" gs-y="0" gs-w="2" gs-h="2">
        <div class="grid-stack-item-content" style="background-color:#18bc9c">
          Widget A
        </div>
      </div>

      <div class="grid-stack-item" gs-x="2" gs-y="0" gs-w="3" gs-h="1">
        <div class="grid-stack-item-content" style="background-color:#3498db">
          Widget B
        </div>
      </div>

      <div class="grid-stack-item" gs-x="0" gs-y="2" gs-w="4" gs-h="2">
        <div class="grid-stack-item-content" style="background-color:#e74c3c">
          Widget C
        </div>
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

const isFloat = ref(true);

function toggleFloat() {
  grid.float(!grid.getFloat());
  isFloat.value = grid.getFloat();
}

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
