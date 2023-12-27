import { list } from '@keystone-6/core';
import { allowAll } from '@keystone-6/core/access';

import {
  text,
  integer,
  float,
  relationship,
  password,
  timestamp,
  checkbox,
  image,
  json
} from '@keystone-6/core/fields';

import type { Lists } from '.keystone/types';

export const lists: Lists = {
  User: list({
    access: allowAll,
    fields: {
      name: text({ validation: { isRequired: true } }),
      email: text({
        validation: { isRequired: true },
        isIndexed: 'unique',
      }),
      password: password({ validation: { isRequired: true } }),
      middlename: text(),
      lastname: text(),
      photo: relationship({ ref: 'Image' }),
      phone: text(),
      telegram: text(),
      whatsapp: text(),
      role: text({ defaultValue: 'user' }),
      roleName: text(),
      orders: relationship({ ref: 'Order', many: true }),
      postcode: text(),
      country: text(),
      city: text(),
      street: text(),
      house: text(),
      createdAt: timestamp({ defaultValue: { kind: 'now' } }),
      updatedAt: timestamp({ defaultValue: { kind: 'now' } }),
    },
  }),

  Image: list({
    access: allowAll,
    fields: {
      name: text({ validation: { isRequired: true } }),
      altText: text(),
      image: image({ storage: 'server_storage' }),
    },
  }),

  Product: list({
    access: allowAll,
    fields: {
      title: text({ defaultValue: '' }),
      caption: text({
        db: { nativeType: 'VarChar(1000)' },
        ui: { displayMode: 'textarea' },
      }),
      description: text({
        db: { nativeType: 'VarChar(2000)' },
        ui: { displayMode: 'textarea' },
      }),
      price: integer({ validation: { min: 0 } }),
      oldPrice: integer({ validation: { min: 0 } }),
      bonus: integer({ validation: { min: 0 } }),
      image: relationship({ ref: 'Image' }),
      images: relationship({ ref: 'Image', many: true }),
      vendorCode: text(),
      balance: integer({ validation: { min: 0 } }),
      isActive: checkbox({ defaultValue: true }),
      category: relationship({ ref: 'Category', many: true }),
      subCategory: relationship({ ref: 'SubCategory' }),
      tags: relationship({ ref: 'Tag', many: true }),
      colorName: text({ defaultValue: '' }),
      colorCode: text({ defaultValue: '' }),
      link: text({
        validation: { isRequired: true },
        isIndexed: 'unique',
      }),
      material: text(),
      type: text(),
      handlingType: text(),
      sideHeight: float({ validation: { min: 0 } }), // Высота борта на миделе
      transomHeight: float({ validation: { min: 0 } }), // Высота транца
      overallLength: float({ validation: { min: 0 } }),
      overallWidth: float({ validation: { min: 0 } }),
      weight: float({ validation: { min: 0 } }),
      loadCapacity: float({ validation: { min: 0 } }),
      permissibleMotorPower: text(),
      deadriseAmidships: float({ validation: { min: 0 } }), // Килеватость на миделе
      deadriseTransom: float({ validation: { min: 0 } }), // Килеватость на транце
      passengers: integer({ validation: { min: 0 } }),
      beadThickness: float({ validation: { min: 0 } }), // Толщина борта
      bottomThickness: float({ validation: { min: 0 } }), // Толщина днища
      relatedProducts: relationship({ ref: 'Product', many: true }),
      extras: relationship({ ref: 'Product', many: true }),
      services: relationship({ ref: 'Service', many: true }),
      rating: float({ validation: { min: 0 } }),
      ratings: integer({ validation: { min: 0 } }),
      specifications: text({
        defaultValue: '',
        db: { nativeType: 'VarChar(2000)' },
        ui: { displayMode: 'textarea' },
      }),
      properties: text({
        defaultValue: '',
        db: { nativeType: 'VarChar(2000)' },
        ui: { displayMode: 'textarea' },
      }),
      seoTitle: text(),
      seoDescription: text({
        defaultValue: '',
        db: { nativeType: 'VarChar(2000)' },
        ui: { displayMode: 'textarea' },
      }),
      seoCanonical: text(),
      createdAt: timestamp({ defaultValue: { kind: 'now' } }),
      updatedAt: timestamp({ defaultValue: { kind: 'now' } }),
      clicks: integer({ defaultValue: 0 }),
      orders: integer({ defaultValue: 0 }),
    },
  }),

  Service: list({
    access: allowAll,
    fields: {
      title: text(),
      code: text(),
      caption: text({
        db: { nativeType: 'VarChar(1000)' },
        ui: { displayMode: 'textarea' },
      }),
      description: text({
        db: { nativeType: 'VarChar(2000)' },
        ui: { displayMode: 'textarea' },
      }),
      image: relationship({ ref: 'Image' }),
      price: integer({ validation: { min: 0 } }),
      bonus: integer({ validation: { min: 0 } }),
      vendorCode: integer(),
      isActive: checkbox(),
      category: relationship({ ref: 'Category' }),
      createdAt: timestamp({ defaultValue: { kind: 'now' } }),
      updatedAt: timestamp({ defaultValue: { kind: 'now' } }),
      clicks: integer(),
      orders: integer(),
    },
  }),

  Category: list({
    access: allowAll,
    ui: {
      labelField: 'title',
    },
    fields: {
      code: text(),
      title: text(),
      caption: text({
        db: { nativeType: 'VarChar(1000)' },
        ui: { displayMode: 'textarea' },
      }),
      image: relationship({ ref: 'Image' }),
      children: relationship({ ref: 'SubCategory', many: true }),
      isActive: checkbox({ defaultValue: true }),
      seoTitle: text(),
      seoDescription: text({
        defaultValue: '',
        db: { nativeType: 'VarChar(2000)' },
        ui: { displayMode: 'textarea' },
      }),
      seoCanonical: text(),
      createdAt: timestamp({ defaultValue: { kind: 'now' } }),
      updatedAt: timestamp({ defaultValue: { kind: 'now' } }),
    },
  }),

  SubCategory: list({
    access: allowAll,
    ui: {
      labelField: 'title',
    },
    fields: {
      code: text(),
      title: text(),
      caption: text({
        db: { nativeType: 'VarChar(1000)' },
        ui: { displayMode: 'textarea' },
      }),
      image: relationship({ ref: 'Image' }),
      parent: relationship({ ref: 'Category' }),
      isActive: checkbox({ defaultValue: true }),
      seoTitle: text(),
      seoDescription: text({
        defaultValue: '',
        db: { nativeType: 'VarChar(2000)' },
        ui: { displayMode: 'textarea' },
      }),
      seoCanonical: text(),
      createdAt: timestamp({ defaultValue: { kind: 'now' } }),
      updatedAt: timestamp({ defaultValue: { kind: 'now' } }),
    },
  }),

  Cart: list({
    access: allowAll,
    fields: {
      products: text(),
      userId: text({
        validation: { isRequired: true },
        isIndexed: 'unique',
      }),
      createdAt: timestamp({ defaultValue: { kind: 'now' } }),
      updatedAt: timestamp(),
    }
  }),

  Tag: list({
    access: allowAll,
    fields: {
      code: text(),
      title: text(),
      products: relationship({ ref: 'Product', many: true }),
      createdAt: timestamp({ defaultValue: { kind: 'now' } }),
      updatedAt: timestamp(),
    }
  }),

  FavoritesList: list({
    access: allowAll,
    fields: {
      products: text(),
      userId: text({
        validation: { isRequired: true },
        isIndexed: 'unique',
      }),
      createdAt: timestamp({ defaultValue: { kind: 'now' } }),
      updatedAt: timestamp(),
    }
  }),

  OrderStatus: list({
    access: allowAll,
    ui: {
      searchFields: ['code', 'title'],
      labelField: 'code',
    },
    fields: {
      code: text(),
      color: text(),
      title: text(),
      createdAt: timestamp({ defaultValue: { kind: 'now' } }),
      updatedAt: timestamp(),
    }
  }),

  Order: list({
    access: allowAll,
    fields: {
      products: json(),
      user: relationship({ ref: 'User' }),
      status: relationship({ ref: 'OrderStatus' }),
      address: text(),
      comment: text(),
      createdAt: timestamp({ defaultValue: { kind: 'now' } }),
      updatedAt: timestamp(),
    }
  }),

  Question: list({
    access: allowAll,
    fields: {
      name: text(),
      phone: text(),
      createdAt: timestamp({ defaultValue: { kind: 'now' } }),
      updatedAt: timestamp(),
    }
  }),

  Review: list({
    access: allowAll,
    fields: {
      name: text(),
      phone: text(),
      text: text(),
      createdAt: timestamp({ defaultValue: { kind: 'now' } }),
      updatedAt: timestamp(),
    }
  }),
};
