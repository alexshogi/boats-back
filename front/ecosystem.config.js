module.exports = {
  apps: [
    {
      name: 'front',
      exec_mode: 'cluster',
      instances: 2,
      script: './node_modules/nuxt/bin/nuxt.js',
      args: 'start',
      port: 8080,
    }
  ]
}