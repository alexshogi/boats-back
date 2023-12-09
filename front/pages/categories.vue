<template>
  <v-container ref="page" class="categories-page" style="margin-top: 52px;">
    <div
      v-for="c in categories"
      :key="c.id"
      class="cats-container"
    >
      <v-card class="pa-2 cat-card" flat>
        <NuxtLink :to="`/catalog?category=${c.code}`">
          <h3>{{ c.title }}</h3>
        </NuxtLink>

        <div class="scats-container">
          <v-card
            v-for="sc in subCategories"
            :key="sc.id"
            v-if="sc.parent.id === c.id"
            class="pa-2 scat-card"
            flat
          >
            <NuxtLink :to="`/catalog?category=${sc.code}`">
              <h4>{{ sc.title }}</h4>
            </NuxtLink>
          </v-card>
        </div>
      </v-card>
    </div>
  </v-container>
</template>

<script>
export default {
  auth: false,
  name: 'CategoriesPage',
  data() {
    return {
      loading: false,
      categories: [],
      subCategories: [],
    }
  },
  async mounted() {
    await this.getCats();
    await this.getSubCats();
    await this.getSubSubCats();
  },
  methods: {
    async getCats () {
      this.loading = true;

      const graphqlQuery = {
        query: `
          query {
            categories {
              id
              code
              isActive
              title
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });

      if (response?.data?.data?.categories) {
        this.categories = [...response.data.data.categories];
      }

      this.loading = false;
    },
    async getSubCats () {
      this.loading = true;

      const graphqlQuery = {
        query: `
          query {
            subCategories {
              id
              code
              isActive
              title
              parent {
                id
                code
                isActive
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

      if (response?.data?.data?.subCategories) {
        this.subCategories = [...response.data.data.subCategories];
      }

      this.loading = false;
    },
  }
}
</script>

<style lang="scss" scoped>
.cats-container {
  grid-gap: 20px;
  display: grid;
  grid-template-columns: 1;
  padding: 20px;

  .cat-card {
    min-height: 26px;
    background-color: #272727;
    position: relative;
    color: #fafafa;

    h3 {
      margin-bottom: 8px;
    }
  }
}

.scats-container {
  grid-gap: 10px;
  display: grid;
  grid-template-columns: 1;

  .scat-card {
    min-height: 26px;
    background-color: #3a3a3a;
    position: relative;
    color: #fafafa;

    h4 {
      margin-bottom: 5px;
    }
  }
}

.sscats-container {
  grid-gap: 5px;
  display: grid;
  grid-template-columns: 1;

  .sscat-card {
    min-height: 26px;
    background-color: #505050;
    position: relative;
    color: #fafafa;
  }
}
</style>
