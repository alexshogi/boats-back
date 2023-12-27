"use strict";
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// keystone.ts
var keystone_exports = {};
__export(keystone_exports, {
  default: () => keystone_default
});
module.exports = __toCommonJS(keystone_exports);
var import_core2 = require("@keystone-6/core");

// schema.ts
var import_core = require("@keystone-6/core");
var import_access = require("@keystone-6/core/access");
var import_fields = require("@keystone-6/core/fields");
var lists = {
  User: (0, import_core.list)({
    access: import_access.allowAll,
    fields: {
      name: (0, import_fields.text)({ validation: { isRequired: true } }),
      email: (0, import_fields.text)({
        validation: { isRequired: true },
        isIndexed: "unique"
      }),
      password: (0, import_fields.password)({ validation: { isRequired: true } }),
      middlename: (0, import_fields.text)(),
      lastname: (0, import_fields.text)(),
      photo: (0, import_fields.relationship)({ ref: "Image" }),
      phone: (0, import_fields.text)(),
      telegram: (0, import_fields.text)(),
      whatsapp: (0, import_fields.text)(),
      role: (0, import_fields.text)({ defaultValue: "user" }),
      roleName: (0, import_fields.text)(),
      orders: (0, import_fields.relationship)({ ref: "Order", many: true }),
      postcode: (0, import_fields.text)(),
      country: (0, import_fields.text)(),
      city: (0, import_fields.text)(),
      street: (0, import_fields.text)(),
      house: (0, import_fields.text)(),
      createdAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } }),
      updatedAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } })
    }
  }),
  Image: (0, import_core.list)({
    access: import_access.allowAll,
    fields: {
      name: (0, import_fields.text)({ validation: { isRequired: true } }),
      altText: (0, import_fields.text)(),
      image: (0, import_fields.image)({ storage: "server_storage" })
    }
  }),
  Product: (0, import_core.list)({
    access: import_access.allowAll,
    fields: {
      title: (0, import_fields.text)({ defaultValue: "" }),
      caption: (0, import_fields.text)({
        db: { nativeType: "VarChar(1000)" },
        ui: { displayMode: "textarea" }
      }),
      description: (0, import_fields.text)({
        db: { nativeType: "VarChar(2000)" },
        ui: { displayMode: "textarea" }
      }),
      price: (0, import_fields.integer)({ validation: { min: 0 } }),
      oldPrice: (0, import_fields.integer)({ validation: { min: 0 } }),
      bonus: (0, import_fields.integer)({ validation: { min: 0 } }),
      image: (0, import_fields.relationship)({ ref: "Image" }),
      images: (0, import_fields.relationship)({ ref: "Image", many: true }),
      vendorCode: (0, import_fields.text)(),
      balance: (0, import_fields.integer)({ validation: { min: 0 } }),
      isActive: (0, import_fields.checkbox)({ defaultValue: true }),
      category: (0, import_fields.relationship)({ ref: "Category", many: true }),
      subCategory: (0, import_fields.relationship)({ ref: "SubCategory" }),
      tags: (0, import_fields.relationship)({ ref: "Tag", many: true }),
      colorName: (0, import_fields.text)({ defaultValue: "" }),
      colorCode: (0, import_fields.text)({ defaultValue: "" }),
      link: (0, import_fields.text)({
        validation: { isRequired: true },
        isIndexed: "unique"
      }),
      material: (0, import_fields.text)(),
      type: (0, import_fields.text)(),
      handlingType: (0, import_fields.text)(),
      sideHeight: (0, import_fields.float)({ validation: { min: 0 } }),
      // Высота борта на миделе
      transomHeight: (0, import_fields.float)({ validation: { min: 0 } }),
      // Высота транца
      overallLength: (0, import_fields.float)({ validation: { min: 0 } }),
      overallWidth: (0, import_fields.float)({ validation: { min: 0 } }),
      weight: (0, import_fields.float)({ validation: { min: 0 } }),
      loadCapacity: (0, import_fields.float)({ validation: { min: 0 } }),
      permissibleMotorPower: (0, import_fields.text)(),
      deadriseAmidships: (0, import_fields.float)({ validation: { min: 0 } }),
      // Килеватость на миделе
      deadriseTransom: (0, import_fields.float)({ validation: { min: 0 } }),
      // Килеватость на транце
      passengers: (0, import_fields.integer)({ validation: { min: 0 } }),
      beadThickness: (0, import_fields.float)({ validation: { min: 0 } }),
      // Толщина борта
      bottomThickness: (0, import_fields.float)({ validation: { min: 0 } }),
      // Толщина днища
      relatedProducts: (0, import_fields.relationship)({ ref: "Product", many: true }),
      extras: (0, import_fields.relationship)({ ref: "Product", many: true }),
      services: (0, import_fields.relationship)({ ref: "Service", many: true }),
      rating: (0, import_fields.float)({ validation: { min: 0 } }),
      ratings: (0, import_fields.integer)({ validation: { min: 0 } }),
      specifications: (0, import_fields.text)({
        defaultValue: "",
        db: { nativeType: "VarChar(2000)" },
        ui: { displayMode: "textarea" }
      }),
      properties: (0, import_fields.text)({
        defaultValue: "",
        db: { nativeType: "VarChar(2000)" },
        ui: { displayMode: "textarea" }
      }),
      seoTitle: (0, import_fields.text)(),
      seoDescription: (0, import_fields.text)({
        defaultValue: "",
        db: { nativeType: "VarChar(2000)" },
        ui: { displayMode: "textarea" }
      }),
      seoCanonical: (0, import_fields.text)(),
      createdAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } }),
      updatedAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } }),
      clicks: (0, import_fields.integer)({ defaultValue: 0 }),
      orders: (0, import_fields.integer)({ defaultValue: 0 })
    }
  }),
  Service: (0, import_core.list)({
    access: import_access.allowAll,
    fields: {
      title: (0, import_fields.text)(),
      code: (0, import_fields.text)(),
      caption: (0, import_fields.text)({
        db: { nativeType: "VarChar(1000)" },
        ui: { displayMode: "textarea" }
      }),
      description: (0, import_fields.text)({
        db: { nativeType: "VarChar(2000)" },
        ui: { displayMode: "textarea" }
      }),
      image: (0, import_fields.relationship)({ ref: "Image" }),
      price: (0, import_fields.integer)({ validation: { min: 0 } }),
      bonus: (0, import_fields.integer)({ validation: { min: 0 } }),
      vendorCode: (0, import_fields.integer)(),
      isActive: (0, import_fields.checkbox)(),
      category: (0, import_fields.relationship)({ ref: "Category" }),
      createdAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } }),
      updatedAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } }),
      clicks: (0, import_fields.integer)(),
      orders: (0, import_fields.integer)()
    }
  }),
  Category: (0, import_core.list)({
    access: import_access.allowAll,
    ui: {
      labelField: "title"
    },
    fields: {
      code: (0, import_fields.text)(),
      title: (0, import_fields.text)(),
      caption: (0, import_fields.text)({
        db: { nativeType: "VarChar(1000)" },
        ui: { displayMode: "textarea" }
      }),
      image: (0, import_fields.relationship)({ ref: "Image" }),
      children: (0, import_fields.relationship)({ ref: "SubCategory", many: true }),
      isActive: (0, import_fields.checkbox)({ defaultValue: true }),
      seoTitle: (0, import_fields.text)(),
      seoDescription: (0, import_fields.text)({
        defaultValue: "",
        db: { nativeType: "VarChar(2000)" },
        ui: { displayMode: "textarea" }
      }),
      seoCanonical: (0, import_fields.text)(),
      createdAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } }),
      updatedAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } })
    }
  }),
  SubCategory: (0, import_core.list)({
    access: import_access.allowAll,
    ui: {
      labelField: "title"
    },
    fields: {
      code: (0, import_fields.text)(),
      title: (0, import_fields.text)(),
      caption: (0, import_fields.text)({
        db: { nativeType: "VarChar(1000)" },
        ui: { displayMode: "textarea" }
      }),
      image: (0, import_fields.relationship)({ ref: "Image" }),
      parent: (0, import_fields.relationship)({ ref: "Category" }),
      isActive: (0, import_fields.checkbox)({ defaultValue: true }),
      seoTitle: (0, import_fields.text)(),
      seoDescription: (0, import_fields.text)({
        defaultValue: "",
        db: { nativeType: "VarChar(2000)" },
        ui: { displayMode: "textarea" }
      }),
      seoCanonical: (0, import_fields.text)(),
      createdAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } }),
      updatedAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } })
    }
  }),
  Cart: (0, import_core.list)({
    access: import_access.allowAll,
    fields: {
      products: (0, import_fields.text)(),
      userId: (0, import_fields.text)({
        validation: { isRequired: true },
        isIndexed: "unique"
      }),
      createdAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } }),
      updatedAt: (0, import_fields.timestamp)()
    }
  }),
  Tag: (0, import_core.list)({
    access: import_access.allowAll,
    fields: {
      code: (0, import_fields.text)(),
      title: (0, import_fields.text)(),
      products: (0, import_fields.relationship)({ ref: "Product", many: true }),
      createdAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } }),
      updatedAt: (0, import_fields.timestamp)()
    }
  }),
  FavoritesList: (0, import_core.list)({
    access: import_access.allowAll,
    fields: {
      products: (0, import_fields.text)(),
      userId: (0, import_fields.text)({
        validation: { isRequired: true },
        isIndexed: "unique"
      }),
      createdAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } }),
      updatedAt: (0, import_fields.timestamp)()
    }
  }),
  OrderStatus: (0, import_core.list)({
    access: import_access.allowAll,
    ui: {
      searchFields: ["code", "title"],
      labelField: "code"
    },
    fields: {
      code: (0, import_fields.text)(),
      color: (0, import_fields.text)(),
      title: (0, import_fields.text)(),
      createdAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } }),
      updatedAt: (0, import_fields.timestamp)()
    }
  }),
  Order: (0, import_core.list)({
    access: import_access.allowAll,
    fields: {
      products: (0, import_fields.json)(),
      user: (0, import_fields.relationship)({ ref: "User" }),
      status: (0, import_fields.relationship)({ ref: "OrderStatus" }),
      address: (0, import_fields.text)(),
      comment: (0, import_fields.text)(),
      createdAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } }),
      updatedAt: (0, import_fields.timestamp)()
    }
  }),
  Question: (0, import_core.list)({
    access: import_access.allowAll,
    fields: {
      name: (0, import_fields.text)(),
      phone: (0, import_fields.text)(),
      createdAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } }),
      updatedAt: (0, import_fields.timestamp)()
    }
  }),
  Review: (0, import_core.list)({
    access: import_access.allowAll,
    fields: {
      name: (0, import_fields.text)(),
      phone: (0, import_fields.text)(),
      text: (0, import_fields.text)(),
      createdAt: (0, import_fields.timestamp)({ defaultValue: { kind: "now" } }),
      updatedAt: (0, import_fields.timestamp)()
    }
  })
};

// auth.ts
var import_crypto = require("crypto");
var import_auth = require("@keystone-6/auth");
var import_session = require("@keystone-6/core/session");
var sessionSecret = process.env.SESSION_SECRET;
if (!sessionSecret && process.env.NODE_ENV !== "production") {
  sessionSecret = (0, import_crypto.randomBytes)(32).toString("hex");
}
var { withAuth } = (0, import_auth.createAuth)({
  listKey: "User",
  identityField: "email",
  // this is a GraphQL query fragment for fetching what data will be attached to a context.session
  //   this can be helpful for when you are writing your access control functions
  //   you can find out more at https://keystonejs.com/docs/guides/auth-and-access-control
  sessionData: "name createdAt",
  secretField: "password",
  // WARNING: remove initFirstItem functionality in production
  //   see https://keystonejs.com/docs/config/auth#init-first-item for more
  initFirstItem: {
    // if there are no items in the database, by configuring this field
    //   you are asking the Keystone AdminUI to create a new user
    //   providing inputs for these fields
    fields: ["name", "email", "password"]
    // it uses context.sudo() to do this, which bypasses any access control you might have
    //   you shouldn't use this in production
  }
});
var sessionMaxAge = 60 * 60 * 24 * 30;
var session = (0, import_session.statelessSessions)({
  maxAge: sessionMaxAge,
  secret: sessionSecret
});

// keystone.ts
var keystone_default = withAuth(
  (0, import_core2.config)({
    db: {
      provider: "mysql",
      url: "mysql://root:hello123@mysql:3306/boats",
      // prod
      // url: 'mysql://root:defender2@localhost:3306/platinum', // dev
      onConnect: async (context) => {
        console.log("-> DB connected", context);
      },
      enableLogging: true,
      idField: { kind: "uuid" }
    },
    lists,
    session,
    server: {
      cors: { origin: [
        "http://localhost:8080",
        "http://localhost:8088",
        "http://localhost",
        "http://front:8080",
        "http://front:8088",
        "http://192.168.1.2:8080/"
      ] },
      options: {
        host: "0.0.0.0",
        port: 3e3
      }
    },
    storage: {
      server_storage: {
        kind: "local",
        type: "image",
        generateUrl: (path) => `http://back:3000/images${path}`,
        // prod
        // generateUrl: (path: String) => `http://localhost:3000/images${path}`, // dev
        serverRoute: {
          path: "/images"
        },
        storagePath: "public/images"
      }
    }
  })
);
//# sourceMappingURL=config.js.map
