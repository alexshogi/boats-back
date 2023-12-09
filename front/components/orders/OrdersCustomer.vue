<template>
  <section>
    <v-row class="mt-4">
      <v-col cols="4">
        <v-text-field
          v-model="searchValue"
          clearable
          dense
          outlined
          height="38"
          hide-details
          placeholder="Поиск"
          append-icon="mdi-magnify"
        />
      </v-col>
    </v-row>

    <v-row class="py-5">
      <v-data-table
        :headers="headers"
        :items="filteredOrders"
        :items-per-page="10"
        :loading="loading"
        flat
        style="width: 100%;"
      >
        <template
          v-slot:[`item.id`]="{ item }"
        >
          <NuxtLink
            :to="`/orders/${item.id}`"
          >
            {{ item.id }}
          </NuxtLink>
        </template>
        <template
          v-slot:[`item.createdAt`]="{ item }"
        >
          <span>{{ item.createdAt | datetime }}</span>
        </template>
        <template
          v-slot:[`item.confirmedAt`]="{ item }"
        >
          <span>{{ item.confirmedAt | datetime }}</span>
        </template>
        <template
          v-slot:[`item.paidAt`]="{ item }"
        >
          <span>{{ item.paidAt | datetime }}</span>
        </template>
        <template
          v-slot:[`item.status`]="{ item }"
        >
          <Label
            :value="item.status?.title"
            :color="item.status?.color"
          />
        </template>
        <template
          v-slot:[`item.goodsAmount`]="{ item }"
        >
          <span>{{ calculateOrderGoods(item) }}</span>
        </template>
        <template
          v-slot:[`item.positionsAmount`]="{ item }"
        >
          <span>{{ calculateOrderPositions(item) }}</span>
        </template>
        <template
          v-slot:[`item.sum`]="{ item }"
        >
          <!-- <money-format
            :value="calculateOrderSum(item)"
            locale="ru"
            currency-code="RUB"
          /> -->
        </template>
      </v-data-table>
    </v-row>
  </section>
</template>

<script>
import { mapGetters } from 'vuex';
import Label from '@/components/Label.vue';

export default {
  name: 'OrdersCustomerPage',
  components: {
    Label,
  },
  data() {
    return {
      loading: false,
      searchValue: '',
      orders: [],
    }
  },
  computed: {
    ...mapGetters({
      user: 'user',
    }),
    headers () {
      return [
        { text: 'Заказ', value: 'id' },
        { text: 'Статус', value: 'status', sortable: false },
        { text: 'Создан', value: 'createdAt', sortable: false },
        { text: 'Позиций', value: 'positionsAmount', sortable: false },
        { text: 'Товаров', value: 'goodsAmount', sortable: false },
        { text: 'Сумма заказа', value: 'sum', sortable: false },
      ]
    },
    filteredOrders () {
      if (this.searchValue) {
        return this.orders.filter(p => p.id.toLowerCase().includes(this.searchValue.toLowerCase()));
      }

      return this.orders;
    },
  },
  watch: {
    user () {
      this.getOrders();
    }
  },
  mounted () {
    this.getOrders();
  },
  methods: {
    calculateOrderPositions (order) {
      return order.products?.length || '?';
    },
    calculateOrderGoods (order) {
      let counter = 0;

      for (const product of order.products) {
        counter = counter + product.amount;
      }

      return counter || '?';
    },
    calculateOrderSum (order) {
      let sum = 0;

      for (const item of order.products) {
        sum += item.price * item.amount;
      }

      return sum || '?';
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
              balance
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
              images {
                image {
                  filesize
                  width
                  height
                  extension
                  url
                }
              }
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
    async getOrders () {
      this.loading = true;

      const graphqlQuery = {
        query: `
          query {
            orders (
              where: {
                user: {
                  id: {
                    equals: "${this.user.id}"
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
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });

      const orders = response?.data?.data?.orders;

      if (orders) {
        for (const o of orders) {
          if (o.products) {
            o.products = JSON.parse(o.products.replace(/'/g, '"'));
            o.products = await this.getOrderProducts(o.products);
          }
        }

        this.orders = orders;
      }

      this.loading = false;
    }
  }
}
</script>
