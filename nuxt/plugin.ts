import { defineNuxtPlugin } from '#app'

import Button from '../app/components/Button.vue'

export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.vueApp.component('Button', Button)
})
