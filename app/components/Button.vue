<template>
  <button
    class="Button"
    :class="[{ disabled, outlined }, sizeClass]"
    :style="{
      color: textColor,
      background: backgroundColor,
      border: `1px solid ${borderColor}`,
    }"
    @click="$emit('click')"
    :disabled="disabled"
  >
    <div class="Button-content">
      <span
        v-if="loading"
        class="loader"
        :style="{ borderColor: borderColor }"
      />
      <span class="label" :class="{ hidden: loading }">{{ label }}</span>
    </div>
  </button>
</template>

<script setup lang="ts">
import { computed, defineProps, defineEmits } from "vue";

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
  backgroundColor: {
    type: String,
    default: "#000000",
  },
  textColor: {
    type: String,
    default: "#000000",
  },
  borderColor: {
    type: String,
    default: "#000000",
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
  transition: var(--button-transition);
  background: var(--button-background);
  border-radius: var(--button-radius);
  box-shadow: var(--button-shadow);
  padding: var(--button-padding);
  font-size: var(--font-size-0);
  color: var(--font-color-0);
  justify-content: center;
  white-space: nowrap;
  align-items: center;
  font-weight: bold;
  cursor: pointer;
  display: flex;
}

.Button:hover {
  opacity: 0.8;
  box-shadow: var(--button-hover-shadow);
}

.Button.disabled {
  pointer-events: none;
  background: var(--primary-b);
  border: 1px solid var(--primary-b);
}

.Button-content {
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
  padding: var(--button-padding);
  font-size: var(--font-size-1);
}

.btn-mid {
  font-size: var(--font-size-1);
  padding: var(--button-padding);
}

.btn-large {
  padding: var(--button-padding);
  font-size: var(--font-size-1);
}

.loader {
  left: 25%;
  right: 25%;
  width: 1rem;
  height: 1rem;
  position: absolute;
  border: 2px solid #000000;
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
