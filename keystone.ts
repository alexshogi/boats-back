// Welcome to Keystone!
//
// This file is what Keystone uses as the entry-point to your headless backend
//
// Keystone imports the default export of this file, expecting a Keystone configuration object
//   you can find out more at https://keystonejs.com/docs/apis/config

import { config } from '@keystone-6/core';

// to keep this file tidy, we define our schema in a different file
import { lists } from './schema';

// authentication is configured separately here too, but you might move this elsewhere
// when you write your list-level access control functions, as they typically rely on session data
import { withAuth, session } from './auth';

// import storage to save images there
// import type { StorageConfig } from '@keystone-6/core/types'

// import mysql from "mysql2/promise";
      
// const client = await mysql.createConnection({
//     host: 'psedge.global',
//     port: parseInt(process.env.POLYSCALE_DB_PORT),
//     user: process.env.POLYSCALE_DB_USERNAME,
//     password: process.env.POLYSCALE_DB_PASSWORD,
//     database: process.env.POLYSCALE_DB_DATABASE,
//     ssl: {
//         rejectUnauthorized: true,
//     },
// });

export default withAuth(
  config({
    db: {
      provider: 'mysql',
      url: `mysql://${process.env.POLYSCALE_DB_USERNAME}:${process.env.POLYSCALE_DB_PASSWORD}@psedge.global:${parseInt(process.env.POLYSCALE_DB_PORT)}/${process.env.POLYSCALE_DB_DATABASE}`, // prod
      // url: 'mysql://root:defender2@localhost:3306/platinum', // dev
      onConnect: async (context: any) => {
        console.log('-> DB connected', context)
      },
      enableLogging: true,
      idField: { kind: 'uuid' },
    },
    lists,
    session,
    server: {
      cors: { origin: [
        'http://localhost:8080',
        'http://localhost:8088',
        'http://localhost',
        'http://front:8080',
        'http://front:8088',
        'http://192.168.1.2:8080/'
      ] },
      options: {
        host: '0.0.0.0',
        port: 3000,
      },
    },
    storage: {
      server_storage: {
        kind: 'local',
        type: 'image',
        generateUrl: path => `http://back:3000/images${path}`, // prod
        // generateUrl: (path: String) => `http://localhost:3000/images${path}`, // dev
        serverRoute: {
          path: '/images',
        },
        storagePath: 'public/images',
      },
    },
  })
);
