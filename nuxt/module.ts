import { defineNuxtModule, addPlugin, createResolver } from '@nuxt/kit'

export default defineNuxtModule({
  meta: {
    name: 'sober',
    configKey: 'sober'
  },
  setup(_, nuxt) {
    const resolver = createResolver(import.meta.url)

    addPlugin(resolver.resolve('./plugin'))
  }
})
