<template>
  <v-container class="common-page cart-page">
    <div class="steps">
      <NuxtLink
        to="/cart"
      >
        <span class="step previous">Шаг&nbsp;1</span>
      </NuxtLink>
      <span class="step">Шаг&nbsp;2</span>
    </div>
    <h2>Ваш заказ:</h2>
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
        <h4>{{ item.title }}</h4>
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
          <h4>{{ item.title }}</h4>
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
        :style="`background-image: url(${item.image?.image?.url})`"
        alt="PHOTO"
      />
      <div class="item-body">
        <div class="item-title">
          <h4>{{ item.title }}</h4>
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
      </div>
    </article>

    <section class="cart-sum">
      <span>Сумма: {{ totalPrice }} ₽</span>
    </section>

    <section class="checkout-form">
      <div class="form-block">
        <h2>Данные клиента</h2>

        <v-form
          ref="form"
          v-model="valid"
          lazy-validation
        >
          <v-text-field
            v-model="name"
            dense
            placeholder="Имя"
            outlined
            :rules="[rules.required]"
          />

          <v-text-field
            v-model="phone"
            dense
            v-mask="'+7 (###) ###-##-##'"
            placeholder="Телефон"
            outlined
            :rules="[rules.required]"
          />

          <v-text-field
            v-model="email"
            dense
            placeholder="Email"
            outlined
            :rules="emailRules"
          />
        </v-form>
      </div>

      <div class="form-block">
        <h2>Способ доставки:</h2>
        <v-radio-group
          v-model="delivery"
          column
        >
          <v-radio
            label="Заберу из магазина"
            value="self"
          />
          <v-radio
            label="Доставка по городу"
            value="city"
          />
        </v-radio-group>

        <v-text-field
          v-if="delivery === 'city'"
          v-model="address"
          dense
          placeholder="Адрес"
          outlined
          hide-details
        />
      </div>

      <div class="form-block">
        <h2>Способ оплаты:</h2>
        <v-radio-group
          v-model="payment"
          column
        >
          <v-radio
            label="Оплата банковской картой"
            value="card"
          />
          <v-radio
            label="Оплата наличными"
            value="cash"
          />
        </v-radio-group>
      </div>

      <div class="form-block">
        <v-btn
          color="primary"
          class="btn btn-primary mb-3"
          depressed
          :disabled="!products.length"
          @click="validate"
        >
          Оформить заказ
        </v-btn>
        <p class="additional-text">
          Нажимая кнопку &laquo;Оформить заказ&raquo;, вы&nbsp;соглашаетесь с&nbsp;<NuxtLink to="/privacy-policy">Политикой конфиденциальности</NuxtLink>
        </p>
      </div>
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

    <v-bottom-sheet v-model="bottomSheet">
      <v-sheet
        class="text-center pa-6"
        height="220px"
      >
        <h2 class="py-5 mb-5">
          Заказ успешно создан
        </h2>
        <!-- <NuxtLink
          to="/orders"
          style="text-decoration: none; font-size: 14px;"
        >
          <v-btn
            color="primary"
            class="btn btn-primary mb-3"
            depressed
          >
            Заказы
          </v-btn>
        </NuxtLink> -->
        <NuxtLink
          to="/catalog?category=all"
          style="text-decoration: none; font-size: 14px;"
        >
          <v-btn
            color="primary"
            class="btn btn-primary mb-3"
            depressed
          >
            Продолжить покупки
          </v-btn>
        </NuxtLink>
      </v-sheet>
    </v-bottom-sheet>
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import SliderGoods from '@/components/SliderGoods.vue';

export default {
  name: 'CheckoutPage',
  components: {
    SliderGoods,
  },
  data () {
    return {
      all: false,
      confirmRemoveDialog: false,
      productToRemoveId: '',
      orderStatuses: [],
      bottomSheet: false,
      products: [],
      services: [],
      accessories: [],
      delivery: 'self',
      payment: 'card',
      name: '',
      phone: '',
      email: '',
      address: '',
      rules: {
        required: value => !!value || 'Обязательное поле',
      },
      emailRules: [
        v => !!v || 'Обязательное поле',
        v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
      ],
      errorMessage: '',
      valid: true,
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
        this.email = newVal.email;
        this.name = newVal.name;
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

    this.checkCart();

    if (this.user?.id) {
      this.email = this.user.email;
      this.name = this.user.name;
    }
  },
  methods: {
    ...mapActions({
      removeProductFromCart: 'removeProductFromCart',
      setCartProductAmount: 'setCartProductAmount',
      clearCart: 'clearCart',
    }),
    validate () {
      this.$refs.form.validate();

      if (this.valid) {
        this.checkout();
      }
    },
    reset () {
      this.$refs.form.reset();
    },
    resetValidation () {
      this.$refs.form.resetValidation();
    },
    checkCart () {
      if (this.cartProducts?.length) {
        this.getCartProducts();
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
              link
              price
              bonus
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
              photo_1
              photo_2
              photo_3
              photo_4
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

      let comment = '';

      comment += `Доставка: ${this.delivery === 'self' ? 'Самовывоз из магазина' : 'Доставка по городу'}. `;
      comment += `Оплата: ${this.payment === 'card' ? 'Банковской картой' : 'Наличными'}. `;
      comment += `Имя: ${this.name}. `;
      comment += `Телефон: ${this.phone}. `;
      comment += `Почта: ${this.email}. `;
      comment += `Адрес: ${this.address}. `;

      const graphqlQuery = {
        query: `
          mutation {
            createOrder (
              data: {
                products: "${JSON.stringify(this.cartProducts).replace(/"/g, '\'')}",
                user: {
                  connect: {
                    id: "${this.user?.id}"
                  }
                }
                status: {
                  connect: {
                    id: "${orderStatusNew.id}"
                  }
                }
                comment: "${comment}"
                address: "${this.address}"
              }
            ) {
              id
            }
          }
        `
      };

      const graphqlQueryNoUser = {
        query: `
          mutation {
            createOrder (
              data: {
                products: "${JSON.stringify(this.cartProducts).replace(/"/g, '\'')}",
                status: {
                  connect: {
                    id: "${orderStatusNew.id}"
                  }
                }
                comment: "${comment}"
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
        data: this.user?.id ? JSON.stringify(graphqlQuery) : JSON.stringify(graphqlQueryNoUser)
      });

      if (response?.data?.data?.createOrder?.id) {
        this.clearCart();
        this.updateCart();
        this.createdOrderId = response.data.data.createOrder.id;
        this.bottomSheet = true;

        this.products = [];
        this.accessories = [];
        this.delivery = 'self';
        this.payment = 'card';
        this.name = '';
        this.phone = '';
        this.email = '';
        this.address = '';
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

  .checkout-form .v-input {
    border-radius: 15px;
    margin-bottom: 10px;
  }

  .checkout-form .v-input .v-text-field__slot {
    height: 60px;
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

      .step.previous {
        color: #A08F8F;
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

  .cart-page .item-mobile {
    display: none;
  }

  .checkout-form {

    .form-block {
      margin-bottom: 80px;
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
    }
  }
</style>
