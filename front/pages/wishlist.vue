<template>
  <v-container
    ref="page"
    class="favorites-page"
  >
    <section v-if="loading" class="favorites-container">
      <v-skeleton-loader
        v-for="i in 12"
        :key="i"
        type="image, article, actions"
        class="product-card"
      />
    </section>

    <section v-else class="favorites-container">
      <NuxtLink
        v-for="p in products"
        :key="p.id"
        :to="`/catalog/${p.link}`"
        class="text-decoration-none"
      >
        <ProductCard
          :product="p"
        />
      </NuxtLink>

      <ServiceCard
        v-for="s in services"
        :key="s.id"
        :service="s"
      />

      <h3 v-if="!products?.length && !services?.length">Здесь пока пусто</h3>
    </section>
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import ProductCard from '@/components/goods/ProductCard.vue';
import ServiceCard from '@/components/ServiceCard.vue';
import Icon from '@/components/Icon.vue';

export default {
  name: 'FavoritesPage',
  components: {
    ProductCard,
    ServiceCard,
    Icon,
  },
  data () {
    return {
      products: [],
      services: [],
      loading: false,
    }
  },
  computed: {
    ...mapGetters({
      favoritesProducts: 'favoritesProducts',
      favoritesServices: 'favoritesServices',
    }),
  },
  async mounted () {
    await this.getProducts();
    await this.getServices();
  },
  methods: {
    async getProducts () {
      let queryString = '';

      for (const p of this.favoritesProducts) {
        queryString += `{ id: { equals: "${p}" } }`;
      }

      if (!queryString) return;

      this.loading = true;

      const graphqlQuery = {
        query: `
          query {
            products (where: { OR: [
              ${queryString}
            ] }) {
              id
              link
              title
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
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });

      if (response?.data?.data?.products) {
        this.products = [...response.data.data.products.filter(p => p.isActive)];
      }

      this.loading = false;
    },
    async getServices () {
      let queryString = '';

      for (const s of this.favoritesServices) {
        queryString += `{ id: { equals: "${s}" } }`;
      }

      if (!queryString) return;

      this.loading = true;

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
        this.services = [...response.data.data.services.filter(s => s.isActive)];
      }

      this.loading = false;
    },
  }
}
</script>

<style scoped>
.favorites-page {
  padding-top: 120px;
}
.favorites-container {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 90px 30px;
}

@media (max-width: 800px) {
  .favorites-page {
    padding-top: 40px;
  }

  .favorites-container {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 45px 15px;
  }
}
</style>

<style>
.v-skeleton-loader.product-card {
  padding-bottom: 0;
  border-radius: 15px;
  pointer-events: none;
}
.v-skeleton-loader__image {
  height: 210px;
  border-radius: 0;
}
.v-skeleton-loader__image,
.v-skeleton-loader__article,
.v-skeleton-loader__actions {
  border-radius: 0 !important;
}
</style>
