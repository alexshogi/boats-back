module.exports = {
  apps: [
    {
      name: 'iplatinum-api',
      script: './node_modules/@keystone-6/core/bin/cli.js',
      args: 'start',
      instances: 3,
      exec_mode: 'cluster',
      wait_ready: true,
      listen_timeout: 10000,
      port: 3000,
    },
  ],
};
