<template>
  <v-container
    ref="page"
    class="orders-page"
    style="margin-top: 52px;"
  >
    <h1 class="mb-4">Заказы</h1>
    <v-tabs v-model="tab">
      <v-tab
        v-for="item in tabItems"
        :key="item.tab"
        class="ml-3"
      >
        {{ item.tab }}
      </v-tab>
    </v-tabs>

    <v-tabs-items v-model="tab">
      <v-tab-item
        v-for="item in tabItems"
        :key="item.tab"
      >
        <v-card flat>
          <v-card-text>
            <component :is="item.content" />
          </v-card-text>
        </v-card>
      </v-tab-item>
    </v-tabs-items>
  </v-container>
</template>

<script>
import { mapGetters } from 'vuex';

import OrdersCustomer from '@/components/orders/OrdersCustomer';

export default {
  name: 'OrderPage',
  components: {
    OrdersCustomer,
  },
  data() {
    return {
      tab: null,
    }
  },
  computed: {
    ...mapGetters({
      user: 'user'
    }),
    tabItems () {
      if (this.user?.role === 'admin') {
        return [
          { tab: 'Заказы', content: 'OrdersCustomer' },
        ]
      }
      
      return [
        { tab: 'Заказы', content: 'OrdersCustomer' },
      ]
    },
  },
  methods: {}
}
</script>

<style lang="scss" scoped>
  .orders-page {

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

    .filters-row {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
      align-items: center;
      color: #616161;
      font-size: 14px;
    }
  }
</style>
