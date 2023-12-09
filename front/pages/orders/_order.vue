<template>
  <v-container
    ref="page"
    class="order-page"
    style="margin-top: 52px;"
  >
    <v-row>
      <v-col>
        <v-card
          flat
          class="pa-4"
        >
          <div class="d-flex justify-start align-center mb-4">
            <h1
              class="mr-8"
              @click="copyOrderIdToClipboard"
            >
              Заказ № {{ order.id }}
            </h1>
            <Label
              v-if="order.status"
              class="mr-8"
              :value="order.status?.title"
              :color="order.status?.color"
            />
            <v-btn
              v-if="order.status?.code !== 'canceled'"
              color="red"
              text
              style="text-transform: none; letter-spacing: normal; padding: 4px 8px; width: fit-content; height: fit-content; font-size: 14px; line-height: 20px;"
              @click="confirmCancelOrder = true"
            >
              Отменить заказ
            </v-btn>
          </div>

          <div class="divider" />

          <v-row
            class="mt-2 mb-2"
            style="font-size: 16px;"
          >
            <v-col
              cols="2"
              style="color: #9E9E9E;"
            >
              Адрес доставки:
            </v-col>
            <v-col cols="10">
              {{ order.address }}
            </v-col>
          </v-row>

          <div class="divider" />

          <section
            class="order-products"
          >
            <v-data-table
              :headers="headers"
              :items="order.products"
              :items-per-page="10"
              :loading="loading"
              flat
              style="width: 100%;"
            >
              <template
                v-slot:[`item.image`]="{ item }"
              >
                <div
                  class="item-image"
                  :style="`background-image: url(${item.image?.image?.url})`"
                  alt="PHOTO"
                />
              </template>
              <template
                v-slot:[`item.title`]="{ item }"
              >
                <span>{{ item.title }}</span>
              </template>
              <template
                v-slot:[`item.price`]="{ item }"
              >
                <!-- <money-format
                  :value="item.price"
                  locale="ru"
                  currency-code="RUB"
                /> -->
              </template>
              <template
                v-slot:[`item.sum`]="{ item }"
              >
                <!-- <money-format
                  :value="item.price * item.amount"
                  locale="ru"
                  currency-code="RUB"
                /> -->
              </template>
            </v-data-table>
          </section>

          <v-row>
            <v-col
              cols="12"
              class="text-right pr-10 pt-10"
            >
              <h2>
                Сумма заказа:
                <!-- <money-format
                  :value="orderSum"
                  locale="ru"
                  currency-code="RUB"
                  style="display: inline-block;"
                /> -->
              </h2>
            </v-col>
          </v-row>

          <v-row v-if="order.comment">
            <v-col cols="12">
              <h4 class="mb-3">Комментарий</h4>
              <p style="font-size: 14px; line-height: 20px; color: #616161;">
                {{ order.comment }}
              </p>
            </v-col>
          </v-row>
        </v-card>
      </v-col>
    </v-row>

    <v-dialog
      v-model="confirmCancelOrder"
      persistent
      max-width="300"
    >
      <v-card>
        <v-card-title class="text-h5">
          Подтверждение
        </v-card-title>
        <v-card-text>Вы уверены, что хотите отменить заказ?</v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="red darken-1"
            text
            @click="cancelOrder"
          >
            Да
          </v-btn>
          <v-btn
            color="green darken-1"
            text
            @click="confirmCancelOrder = false"
          >
            Нет
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-container>
</template>

<script>
import { mapGetters } from 'vuex';
import Label from '@/components/Label.vue';

export default {
  name: 'OrderPage',
  components: {
    Label,
  },
  data () {
    return {
      order: {},
      loading: false,
      orderId: '',
      confirmCancelOrder: false,
      orderStatuses: [],
    }
  },
  computed: {
    ...mapGetters({
      user: 'user',
    }),
    headers () {
      return [
        { text: '', value: 'image', sortable: false, width: 80 },
        { text: 'Название', value: 'title', sortable: false },
        { text: 'Цена', value: 'price', sortable: false },
        { text: 'Количество', value: 'amount', sortable: false },
        { text: 'Сумма', value: 'sum', sortable: false },
      ]
    },
    orderSum () {
      let sum = 0;

      if (this.order.products) {
        for (const item of this.order.products) {
          sum += item.price * item.amount;
        }
      }

      return sum;
    },
  },
  mounted () {
    const orderId = this.$route.params.order;
    this.orderId = orderId;

    this.getOrder();
    this.getOrderStatuses();
  },
  methods: {
    async getOrderStatuses () {
      const graphqlQuery = {
        query: `
          query {
            orderStatuses (
              where: {}
            ) {
              id
              title
              code
              color
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });

      const orderStatuses = response?.data?.data?.orderStatuses;

      this.orderStatuses = orderStatuses;
    },
    async getOrderProducts (orderProducts) {
      let queryString = '';

      for (const p of orderProducts) {
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
              caption
              description
              price
              bonus
              isActive
              vendorCode
              balance
              colorName
              colorCode
              link
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
              specifications
              properties
              category {
                id
                code
                title
              }
              subCategory {
                id
                code
                title
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
          const orderProduct = orderProducts.find(orderProduct => orderProduct.id === p.id);

          if (orderProduct) {
            p.amount = orderProduct.amount;
          }
        }

        return products;
      }
    },
    async getOrder () {
      this.loading = true;

      const graphqlQuery = {
        query: `
          query {
            order (
              where: {
                id: "${this.orderId}"
              }
            ) {
              id
              products
              status {
                code
                color
                title
              }
              address
              comment
              createdAt
              updatedAt
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });

      const order = response?.data?.data?.order;

      if (order) {
        if (order.products) {
          order.products = JSON.parse(order.products.replace(/'/g, '"'));
        }

        order.products = await this.getOrderProducts(order.products);

        this.order = order;
      }

      this.loading = false;
    },
    async copyOrderIdToClipboard () {
      try {
        await navigator.clipboard.writeText(this.orderId);
      } catch (err) {
        console.error('Failed to copy: ', err);
      }
    },
    async cancelOrder () {
      this.loading = true;

      const cancelStatus = this.orderStatuses.find(status => status.code === 'cancel');

      const graphqlQuery = {
        query: `
          mutation {
            updateOrder (
              where: {
                id: "${this.order.id}"
              }
              data: {
                status: {
                  connect: {
                    id: "${cancelStatus.id}"
                  }
                }
              }
            ) {
              id
              products
              status {
                code
                color
                title
              }
              address
              comment
              createdAt
              updatedAt
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });

      console.log('Cancel order response', response);

      const order = response?.data?.data?.order;

      if (order) {
        if (order.products) {
          order.products = JSON.parse(order.products.replace(/'/g, '"'));
        }

        this.order = order;
      }

      this.loading = false;
    }
  }
}
</script>

<style lang="scss" scoped>
  .order-page {

    h1 {
      font-weight: 600;
      font-size: 32px;
      line-height: 44px;
      color: #424242;
    }

    .divider {
      height: 1px;
      width: 100%;
      background-color: #E0E0E0;
    }

    .item-image {
      width: 60px;
      height: 60px;
      background-size: contain;
      background-repeat: no-repeat;
      background-position: center;
    }
  }
</style>
