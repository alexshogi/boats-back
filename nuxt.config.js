export default {
  head: {
    titleTemplate: 'ТАКТИКА',
    title: 'ТАКТИКА',
    htmlAttrs: {
      lang: 'en',
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' },
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.svg' },
    ],
  },
  cache: true,
  css: [
    '~assets/main.css',
  ],
  plugins: [
    '~/plugins/assets.js',
    '~/plugins/v-mask.js',
    '~/plugins/debounce.js',
  ],
  components: true,
  buildModules: [
    '@nuxtjs/vuetify',
  ],
  modules: [
    '@nuxtjs/axios',
    // [ '@nuxtjs/yandex-metrika', {
    //   id: '95444928',
    //   clickmap: true,
    //   trackLinks: true,
    //   accurateTrackBounce: true,
    //   webvisor: true,
    // } ],
  ],
  axios: {
    baseURL: 'https://tacticboat.myecard.ru/api/graphql', // prod
    //baseURL: 'http://localhost:3000/api/graphql', // dev
    timeout: 10000,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
    },
  },
  server: {
    // "host": "0.0.0.0",
    "port": "8080"
  },
  vuetify: {
    theme: {
      themes: {
        light: {
          primary: '#FF343F',
        },
        dark: {
          primary: '#FF343F',
        },
      }
    }
  },
  build: {
    transpile: [
      'vuetify/lib'
    ]
  },
}
