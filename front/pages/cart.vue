<template>
  <v-container class="common-page cart-page">
    <div class="steps">
      <span class="step">Шаг&nbsp;1</span>
    </div>
    <h2>Корзина</h2>
    <div class="divider"></div>

    <span v-if="!products.length" class="text-empty">В корзине пока нет товаров</span>

    <article
      v-for="item in products"
      :key="`desktop_${item.id}`"
      class="cart-item item-desktop"
    >
      <div
        class="item-image"
        :style="`background-image: url(${item.image?.image?.url})`"
        alt="PHOTO"
      />
      <div class="item-title">
        <NuxtLink
          :to="`/catalog/${item.link}`"
          class="text-decoration-none"
        >
          <h4>{{ item.title }}</h4>
        </NuxtLink>
      </div>
      <div class="item-params">
        <div v-if="item.colorCode" class="item-param">
          <span>Цвет:</span>
          <span class="param-color" :style="`background-color: ${item.colorCode}`"></span>
        </div>
      </div>
      <div class="item-amount">
        <v-btn
          class="mx-2"
          fab
          dark
          small
          depressed
          :disabled="item?.amount === 1"
          @click="productAmountDecrease(item)"
        >
          <v-icon dark>
            mdi-minus
          </v-icon>
        </v-btn>

        <span>{{ item.amount }}</span>

        <v-btn
          class="mx-2"
          fab
          dark
          small
          depressed
          @click="productAmountIncrease(item)"
        >
          <v-icon dark>
            mdi-plus
          </v-icon>
        </v-btn>
      </div>
      <div class="item-price">
        <span>{{ item.price?.toLocaleString() }} ₽</span>

        <v-btn
          class="mx-2"
          fab
          dark
          small
          depressed
          @click="handleRemoveClick(item.id)"
        >
          <v-icon dark>
            mdi-close
          </v-icon>
        </v-btn>
      </div>
    </article>

    <article
      v-for="item in products"
      :key="`mobile_${item.id}`"
      class="cart-item item-mobile"
    >
      <div
        class="item-image"
        :style="`background-image: url(${item.image?.image?.url})`"
        alt="PHOTO"
      />
      <div class="item-body">
        <div class="item-title">
          <NuxtLink
            :to="`/catalog/${item.link}`"
            class="text-decoration-none"
          >
            <h4>{{ item.title }}</h4>
          </NuxtLink>
        </div>
        <div class="item-params">
          <div v-if="item.colorCode" class="item-param">
            <span>Цвет:</span>
            <span class="param-color" :style="`background-color: ${item.colorCode}`"></span>
          </div>
        </div>
        <div class="item-amount">
          <v-btn
            class="mx-2"
            fab
            dark
            small
            depressed
            :disabled="item?.amount === 1"
            @click="productAmountDecrease(item)"
          >
            <v-icon dark>
              mdi-minus
            </v-icon>
          </v-btn>

          <span>{{ item.amount }}</span>

          <v-btn
            class="mx-2"
            fab
            dark
            small
            depressed
            @click="productAmountIncrease(item)"
          >
            <v-icon dark>
              mdi-plus
            </v-icon>
          </v-btn>
        </div>
        <div class="item-price">
          <span>{{ item.price?.toLocaleString() }} ₽</span>
        </div>
        <div class="item-actions">
          <v-btn
            class="mx-2"
            fab
            dark
            small
            depressed
            @click="handleRemoveClick(item.id)"
          >
            <v-icon dark>
              mdi-close
            </v-icon>
          </v-btn>
        </div>
      </div>
    </article>

    <article
      v-for="item in services"
      :key="`desktop_${item.id}`"
      class="cart-item item-desktop service-item"
    >
      <div
        class="item-image service-image"
        :style="{ backgroundImage: `url(../images/services/${item.code}.png)` }"
        alt="PHOTO"
      />
      <div class="item-title">
        <h4>{{ item.title }}</h4>
      </div>
      <div class="item-params"></div>
      <div class="item-price">
        <span>{{ item.price?.toLocaleString() }} ₽</span>

        <v-btn
          class="mx-2"
          fab
          dark
          small
          depressed
          @click="handleRemoveServiceClick(item.id)"
        >
          <v-icon dark>
            mdi-close
          </v-icon>
        </v-btn>
      </div>
    </article>

    <article
      v-for="item in services"
      :key="`mobile_${item.id}`"
      class="cart-item item-mobile"
    >
      <div
        class="item-image"
        :style="{ backgroundImage: `url(../images/services/${item.code}.png)` }"
        alt="PHOTO"
      />
      <div class="item-body">
        <div class="item-title">
          <h4>{{ item.title }}</h4>
        </div>
        <div class="item-params"></div>
        <div class="item-amount"></div>
        <div class="item-price">
          <span>{{ item.price?.toLocaleString() }} ₽</span>

          <v-btn
            class="mx-2"
            fab
            dark
            small
            depressed
            @click="handleRemoveServiceClick(item.id)"
          >
            <v-icon dark>
              mdi-close
            </v-icon>
          </v-btn>
        </div>
      </div>
    </article>

    <section class="cart-sum">
      <span>Сумма: {{ totalPrice }} ₽</span>
    </section>

    <h2 class="page-heading">Вам может понадобиться</h2>

    <SliderGoods
      v-if="accessories?.length"
      :products="accessories"
    />

    <section class="cart-actions">
      <NuxtLink
        to="/checkout"
        class="header-nav-link"
      >
        <v-btn
          color="primary"
          class="btn btn-primary"
          depressed
        >
          Оформить заказ
        </v-btn>
      </NuxtLink>
    </section>

    <v-dialog
      v-model="confirmRemoveDialog"
      persistent
      max-width="350"
    >
      <div class="pl-dialog">
        <h4>Убрать этот товар из корзины?</h4>
        <div class="actions">
          <v-btn
            class="btn btn-outline"
            depressed
            @click="removeProduct"
          >
            Убрать
          </v-btn>
          <v-btn
            color="primary"
            class="btn btn-primary"
            depressed
            @click="confirmRemoveDialog = false"
          >
            Отмена
          </v-btn>
        </div>
      </div>
    </v-dialog>
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import SliderGoods from '@/components/SliderGoods.vue';

export default {
  name: 'CartPage',
  components: {
    SliderGoods,
  },
  data () {
    return {
      all: false,
      numberRule: val => {
        if (val < 0) return 'Please enter a positive number'
        return true
      },
      confirmRemoveDialog: false,
      productToRemoveId: '',
      comment: '',
      address: '',
      orderStatuses: [],
      bottomSheet: false,
      products: [],
      services: [],
      accessories: [],
      relatedProducts: [],
    }
  },
  computed: {
    ...mapGetters({
      cartProducts: 'cartProducts',
      cartServices: 'cartServices',
      user: 'user',
      cart: 'cart',
    }),
    totalPrice () {
      let sum = 0;

      for (const item of this.products) {
        sum += item.price * item.amount;
      }

      for (const item of this.services) {
        sum += item.price;
      }

      return sum.toLocaleString();
    },
  },
  watch: {
    user: function (newVal) {
      if (newVal?.id) {
        this.getCartProducts();
        this.getCartServices();
      }
    },
    cart: function (newVal) {
      if (newVal.id) {
        this.getCartProducts();
        this.getCartServices();
      }
    },
    deep: true
  },
  async mounted () {
    this.getCartProducts();
    this.getCartServices();
    await this.getOrderStatuses();
    await this.getAccessories();

    this.checkCart();
  },
  methods: {
    ...mapActions({
      removeProductFromCart: 'removeProductFromCart',
      removeServiceFromCart: 'removeServiceFromCart',
      setCartProductAmount: 'setCartProductAmount',
      clearCart: 'clearCart',
    }),
    checkCart () {
      if (this.cartProducts?.length || this.cartServices?.length) {
        this.getCartProducts();
        this.getCartServices();
      };
    },
    productAmountDecrease(product) {
      if (product.amount === 1) {
        return;
      }

      product.amount -= 1;
      this.setCartProductAmount(product);

      if (this.user?.id) {
        this.updateCart();
      }
    },
    productAmountIncrease(product) {
      product.amount += 1;
      this.setCartProductAmount(product);

      if (this.user?.id) {
        this.updateCart();
      }
    },
    handleRemoveClick (productId) {
      this.productToRemoveId = productId;
      this.confirmRemoveDialog = true;
    },
    removeProduct () {
      this.removeProductFromCart(this.productToRemoveId);
      this.confirmRemoveDialog = false;

      this.products = [ ...this.products.filter(p => p.id !== this.productToRemoveId) ];
      
      if (this.user?.id) {
        this.updateCart();
      }
    },
    async getAccessories () {
      this.loading = true;

      const graphqlQuery = {
        query: `
          query {
            products(
              take: 20,
              where: { category: {id: {equals: "04c73a7a-502b-406c-a337-b77508aefa85"}} }
            ) {
              id
              title
              price
              bonus
              isActive
              image {
                image {
                  filesize
                  width
                  height
                  extension
                  url
                }
              }
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });

      if (response?.data?.data?.products) {
        this.accessories = [...response.data.data.products.filter(p => p.isActive)];
      }

      this.loading = false;
    },
    async getCartProducts () {
      let queryString = '';

      for (const p of this.cartProducts) {
        queryString += `{ id: { equals: "${p.id}" } }`;
      }

      if (!queryString) return;

      const graphqlQuery = {
        query: `
          query {
            products (where: { OR: [
              ${queryString}
            ] }) {
              id
              title
              price
              bonus
              link
              isActive
              vendorCode
              color
              colors
              colorName
              colorCode
              image {
                image {
                  filesize
                  width
                  height
                  extension
                  url
                }
              }
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });

      if (response?.data?.data?.products) {
        const products = response.data.data.products;

        for (const p of products) {
          const cartProduct = this.cartProducts.find(cartProduct => cartProduct.id === p.id);

          if (cartProduct) {
            p.amount = cartProduct.amount;
          }
        }

        this.products = [ ...products ];
      }
    },
    async getCartServices () {
      let queryString = '';

      for (const s of this.cartServices) {
        queryString += `{ id: { equals: "${s.id}" } }`;
      }

      if (!queryString) return;

      const graphqlQuery = {
        query: `
          query {
            services (where: { OR: [
              ${queryString}
            ] }) {
              id
              title
              code
              caption
              description
              price
              bonus
              vendorCode
              isActive
              clicks
              orders
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });

      if (response?.data?.data?.services) {
        const services = response.data.data.services;

        this.services = [ ...services ];
      }
    },
    async updateCart () {
      const graphqlQuery = {
        query: `
          mutation {
            updateCart (
              where: {
                id: "${this.cart.id}"
              }
              data: {
                products: "${JSON.stringify(this.cartProducts).replace(/"/g, '\'')}",
              }
            ) {
              id
              products
              userId
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });
    },
    async getOrderStatuses () {
      const graphqlQuery = {
        query: `
          query {
            orderStatuses {
              id
              code
              color
              title
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });

      if (response?.data?.data?.orderStatuses) {
        this.orderStatuses = [...response.data.data.orderStatuses];
      }
    },
    async checkout () {
      const orderStatusNew = this.orderStatuses.find(os => os.code === 'new');

      const graphqlQuery = {
        query: `
          mutation {
            createOrder (
              data: {
                products: "${JSON.stringify(this.cartProducts).replace(/"/g, '\'')}",
                user: {
                  connect: {
                    id: "${this.user.id}"
                  }
                }
                status: {
                  connect: {
                    id: "${orderStatusNew.id}"
                  }
                }
                comment: "${this.comment}"
                address: "${this.address}"
              }
            ) {
              id
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });

      if (response?.data?.data?.createOrder?.id) {
        this.clearCart();
        this.updateCart();
        this.createdOrderId = response.data.data.createOrder.id;
        this.bottomSheet = true;
      }
    },
  }
}
</script>

<style>
  .v-label {
    font-size: 14px;
    line-height: 19px;
  }

  .pl-dialog {
    padding: 16px 32px;
    background-color: #272727;
    margin-bottom: 16px;
  }

  .pl-dialog h4 {
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
    text-align: left;
  }

  .pl-dialog .actions {
    padding-top: 32px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
  }
</style>

<style lang="scss" scoped>
  .cart-page {
    .steps {
      margin-bottom: 15px;

      .step {
        display: inline-block;
        font-size: 18px;
        font-weight: 400;
        line-height: 24px;
        text-align: left;
        margin-right: 40px;
      }
    }

    h2 {
      margin-bottom: 30px;
    }

    h2.page-heading {
      margin-bottom: 70px;
      text-align: center;
    }

    .text-empty {
      display: inline-block;
      margin-top: 20px;
    }

    .divider {
      height: 1px;
      width: 100%;
      background-color: #979797;
    }

    .cart-sum {
      font-size: 28px;
      font-weight: 700;
      line-height: 37px;
      text-align: right;
      padding: 40px 30px;
      margin-bottom: 80px;
    }

    .slider {
      margin-bottom: 70px;
    }

    .cart-actions {
      display: flex;
      justify-content: space-around;
      align-items: center;
    }

    .cart-item {
      border-bottom: 1px solid #979797;
      height: 235px;
      padding: 20px 25px;
      display: flex;
      flex-direction: row;
      gap: 50px;

      .item-image {
        width: 160px;
        min-width: 160px;
        max-width: 160px;
        height: 100%;
        background-size: contain;
        background-repeat: no-repeat;
        background-position: center;
      }

      .item-title {
        display: flex;
        width: 220px;
        min-width: 220px;
        max-width: 220px;
        height: 100%;
        align-items: center;
      }

      .item-params {
        display: flex;
        width: 100%;
        height: 100%;
        align-items: center;
        gap: 20px;
        flex-wrap: wrap;

        .item-param {
          height: 40px;
          border-radius: 15px;
          background-color: #e6e6e6;
          padding: 8px 18px;
          color: #111111;
          display: flex;
          align-items: center;
          gap: 15px;

          .param-color {
            display: inline-block;
            height: 22px;
            width: 22px;
            border: 1px solid #111111;
            border-radius: 50%;
          }
        }
      }

      .item-amount {
        display: flex;
        width: 220px;
        height: 100%;
        align-items: center;

        span {
          font-size: 18px;
          font-weight: 700;
          line-height: 24px;
          text-align: center;
          display: inline-block;
          margin-left: 10px;
          margin-right: 10px;
        }

        button {
          height: 20px;
          width: 20px;

          .v-icon {
            height: 20px;
            font-size: 15px;
            width: 20px;
          }
        }
      }

      .item-price {
        display: flex;
        width: 160px;
        min-width: 160px;
        max-width: 160px;
        height: 100%;
        align-items: center;
        justify-content: flex-end;

        span {
          font-size: 18px;
          font-weight: 700;
          line-height: 24px;
          text-align: left;
          display: inline-block;
          margin-right: 10px;
        }

        button {
          height: 20px;
          width: 20px;

          .v-icon {
            height: 20px;
            font-size: 15px;
            width: 20px;
          }
        }
      }

      h4 {
        font-size: 18px;
        font-weight: 700;
        line-height: 24px;
        text-align: left;
      }

      .text-info {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
      }
    }
  }

  .service-item {
    align-items: center;

    .service-image {
      max-height: 120px;
      max-width: 120px;
    }

    .item-title {
      flex: 1;
      max-width: unset !important;
    }

    .item-params {
      max-width: 0px;
    }
  } 

  .cart-page .item-mobile {
    display: none;
  }

  @media (max-width: 800px) {
    .cart-page .cart-item {
      padding: 0;
      gap: 16px;
    }

    .cart-page .item-desktop {
      display: none;
    }

    .cart-page .item-mobile {
      display: flex;
      padding: 8px 0;
    }

    .cart-page .item-mobile .item-body {
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      justify-content: space-between;
      padding: 8px;
    }

    .cart-page .item-mobile .item-title {
      display: flex;
      width: 180px;
      min-width: 180px;
      max-width: 180px;
      height: 100%;
      align-items: center;
      font-size: 12px;
    }

    .cart-page .item-mobile .item-title h4 {
      font-size: 16px;
      font-weight: 700;
      line-height: 20px;
      text-align: left;
    }

    .cart-page .item-mobile .item-amount {
      width: 100%;
    }

    .cart-page .item-mobile .item-price {
      display: flex;
      width: auto;
      min-width: auto;
      max-width: auto;
      height: 100%;
      align-items: center;
      justify-content: flex-start;
      margin: 12px 0;
      padding-left: 8px;
    }

    .cart-page .item-mobile .item-actions {
      display: flex;
      width: 100%;
      justify-content: flex-end;
    }

    .cart-page .item-mobile .item-actions .v-btn {
      height: 24px;
      width: 24px;
    }
  }
</style>
