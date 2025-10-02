import { defineNuxtPlugin } from '#app'

import '../app/assets/css/sober.css'

import Button from '../app/components/Button.vue'

export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.vueApp.component('Button', Button)
})
