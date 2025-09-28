<template>
  <button
    class="Button"
    :class="[{ disabled, outlined }, sizeClass]"
    @click="$emit('click')"
    :disabled="disabled"
  >
    <div class="Button-body flex">
      <span class="loader" v-if="loading" />
      <span class="label" :class="{ hidden: loading }">{{ label }}</span>
    </div>
  </button>
</template>

<script setup lang="ts">
const props = defineProps({
  size: {
    type: String as PropType<"mini" | "mid" | "large">,
    default: "mid",
  },
  label: {
    type: String,
    default: "text",
  },
  disabled: {
    type: Boolean,
    default: false,
  },
  outlined: {
    type: Boolean,
    default: false,
  },
  loading: {
    type: Boolean,
    default: false,
  },
});

defineEmits(["click"]);

const sizeClass = computed(() => {
  switch (props.size) {
    case "mini":
      return "btn-mini";
    case "large":
      return "btn-large";
    default:
      return "btn-mid";
  }
});
</script>

<style scoped>
.Button {
  border-radius: var(--button-radius);
  border: 1px solid var(--primary-a);
    box-shadow: var(--button-shadow);
  transition: var(--transition-a);
  padding: var(--button-padding);
  font-size: var(--font-size-0);
  color: var(--font-color-0);
  background: var(--black-0);
  justify-content: center;
  align-items: center;
  font-weight: bold;
  cursor: pointer;
  display: flex;
}

.Button:hover {
  opacity: 0.8;
}

.Button.disabled {
  pointer-events: none;
  background: var(--primary-b);
  border: 1px solid var(--primary-b);
}

.Button-body {
  align-items: center;
  position: relative;
  display: flex;
}

.Button.outlined {
  border: 1px solid var(--primary-a);
  background: transparent;
  color: var(--primary-a);
}

.Button.outlined:hover {
  border: 1px solid var(--primary-a);
  background: var(--primary-a);
  color: var(--text-w);
}

.Button.outlined.disabled {
  pointer-events: none;
}

.label.hidden {
  opacity: 0;
}

.btn-mini {
  padding: 0.5rem 1rem;
  font-size: var(--font-size-1);
}

.btn-mid {
  font-size: var(--font-size-1);
  padding: 0.75rem 1rem;
}

.btn-large {
  padding: 1rem;
  font-size: var(--font-size-1);
}

.loader {
  left: 25%;
  right: 25%;
  width: 1rem;
  height: 1rem;
  position: absolute;
  border: 2px solid #fff;
  border-radius: 50%;
  display: inline-block;
  box-sizing: border-box;
  border-bottom-color: transparent;
  animation: rotation 1s linear infinite;
}

@keyframes rotation {
  0% {
    transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg);
  }
}
</style>
