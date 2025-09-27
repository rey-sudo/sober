<template>
  <div class="container-fluid">
    <h1>Sober</h1>
    <div>
      <a class="btn btn-primary" href="#" @click.prevent="addNewWidget">Add Widget</a>
      <a class="btn btn-primary" href="#" @click.prevent="makeNewWidget">Make Widget</a>
      <a class="btn btn-primary" href="#" id="float" @click.prevent="toggleFloat">
        float: {{ isFloat }}
      </a>
    </div>
    <br><br>
    <div ref="gridRef" class="grid-stack"></div>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import { GridStack } from "gridstack";
import "gridstack/dist/gridstack.css";

const gridRef = ref(null);
let grid;

const isFloat = ref(true);

// paleta de colores
const colors = [
  "#18bc9c", // verde agua
  "#3498db", // azul
  "#9b59b6", // morado
  "#e67e22", // naranja
  "#e74c3c", // rojo
  "#f39c12", // amarillo
];

let items = [
  { x: 1, y: 1 },
  { x: 2, y: 2, w: 3 },
  { x: 4, y: 2 },
  { x: 3, y: 1, h: 2 },
  { x: 0, y: 6, w: 2, h: 2 },
];
let count = 0;

function getNode() {
  let n =
    items[count] || {
      x: Math.round(12 * Math.random()),
      y: Math.round(5 * Math.random()),
      w: Math.round(1 + 3 * Math.random()),
      h: Math.round(1 + 3 * Math.random()),
    };
  n.content = n.content || String(count);
  n.color = colors[count % colors.length]; // asigna un color distinto
  count++;
  return n;
}

function createWidgetElement(n) {
  const el = document.createElement("div");
  el.setAttribute("gs-x", n.x);
  el.setAttribute("gs-y", n.y);
  el.setAttribute("gs-w", n.w || 1);
  el.setAttribute("gs-h", n.h || 1);
  el.innerHTML = `<div class="grid-stack-item-content" style="background-color:${n.color}">${n.content}</div>`;
  return el;
}

function addNewWidget() {
  const n = getNode();
  const el = createWidgetElement(n);
  grid.addWidget(el);
}

function makeNewWidget() {
  const n = getNode();
  const el = createWidgetElement(n);
  grid.el.appendChild(el);
  grid.makeWidget(el);
}

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
  addNewWidget();
});
</script>

<style scoped>
.btn-primary {
  color: #fff;
  background-color: #007bff;
}
.btn {
  display: inline-block;
  padding: 0.375rem 0.75rem;
  line-height: 1.5;
  border-radius: 0.25rem;
}
a {
  text-decoration: none;
}
h1 {
  font-size: 2.5rem;
  margin-bottom: 0.5rem;
}
.grid-stack {
  background: #fafad2;
}
.grid-stack.grid-stack-static {
  background: #eee;
}
.grid-stack-item-content {
  text-align: center;
  color: white;
  font-weight: bold;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.grid-stack-dragging {
  cursor: grabbing;
}
</style>
