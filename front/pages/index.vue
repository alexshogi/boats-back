<template>
  <v-container
    ref="page"
    class="index-page"
  >
    <!-- <section class="hero">
      <SliderMain />
    </section> -->

    <!-- <section class="cats">
      <NuxtLink
        v-for="c in popularCats"
        :key="c.id"
        :to="`/catalog?category=${c.code}`"
        style="text-decoration: none;"
        v-if="c.code !== 'services'"
      >
        <v-card
          class="cat-card"
          flat
        >
          <div
            class="cat-card-image"
            :style="{ backgroundImage: `url(../images/categories/${c.code}.png)` }"
          ></div>
          <h4>{{ c.title }}</h4>
        </v-card>
      </NuxtLink>
    </section> -->

    <!-- <section class="popular">
      <h2>Популярные товары</h2>
      <SliderGoods
        v-if="popularGoods?.length"
        :products="popularGoods"
      />
    </section> -->

    <!-- <section class="accessories">
      <h2>Аксессуары</h2>
      <SliderAccessories
        v-if="popularAccessories?.length"
        :products="popularAccessories"
      />
      <NuxtLink
        to="/catalog"
        class="header-nav-link"
      >
        <v-btn
          color="primary"
          class="btn btn-primary"
          depressed
        >
          Перейти в каталог
        </v-btn>
      </NuxtLink>
    </section> -->

    <!-- <Contacts /> -->
  </v-container>
</template>

<script>
import SliderMain from '@/components/SliderMain.vue';
import SliderGoods from '@/components/SliderGoods.vue';
import SliderAccessories from '@/components/SliderAccessories.vue';
import Contacts from '@/components/Contacts.vue';

export default {
  auth: false,
  name: 'IndexPage',
  components: {
    SliderMain,
    SliderGoods,
    SliderAccessories,
    Contacts,
  },
  data () {
    return {
      loading: false,
      goods: [],
      accessories: [],
      categories: [],
    }
  },
  computed: {
    popularGoods () {
      return this.goods;
    },
    popularAccessories () {
      return this.accessories;
    },
    popularCats () {
      return this.categories;
    }
  },
  mounted () {
    this.getCats();
    this.getGoods();
    this.getAccessories();
  },
  methods: {
    openGoodsItem (item) {
      this.$router.push({ path: `catalog/${item}` });
    },
    async getGoods () {
      this.loading = true;

      const graphqlQuery = {
        query: `
          query {
            products(
              take: 20,
            ) {
              id
              link
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
        this.goods = [...response.data.data.products.filter(p => p.isActive)];
      }

      this.loading = false;
    },
    async getAccessories () {
      this.loading = true;

      const graphqlQuery = {
        query: `
          query {
            products(
              take: 20,
              where: {
                category: { id: { equals: "04c73a7a-502b-406c-a337-b77508aefa85" } }
              }
            ) {
              id
              title
              link
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

      if (response?.data?.data?.categories) {
        this.categories = [...response.data.data.categories];
      }

      this.loading = false;
    }
  }
}
</script>

<style lang="scss" scoped>
.index-page {
  padding: 0;
}

.hero {
  padding-top: 120px;
}

.cats {
  padding-top: 80px;
  gap: 30px 45px;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: 375px;

  .cat-card {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    min-height: 375px;
    width: 100%;
    border: 1px solid #e6e6e6;
    border-radius: 30px;
    background-color: transparent;
    transition: background-color 0.24s;
    overflow: hidden;
    padding: 40px 40px 20px 40px;
    gap: 20px;

    .cat-card-image {
      background-size: contain;
      background-position: center;
      background-repeat: no-repeat;
      width: 100%;
      flex: 1;
    }

    h4 {
      max-width: 90%;
      transition: all 0.27s;
      font-size: 18px;
      font-weight: 600;
      color: #272727;
      transition: color 0.18s;
    }

    &:hover {
      background-color: #e6e6e6;
    }

    &:hover h4 {
      color: #111111;
    }
  }
}

.popular {
  padding-top: 120px;
  text-align: center;
  margin-bottom: 120px;

  h2 {
    margin-bottom: 70px;
  }
}

.accessories {
  padding-top: 120px;
  text-align: center;
  border-radius: 30px;
  border: 1px solid #e6e6e6;
  padding: 70px 50px 80px 50px;
  margin-bottom: 120px;

  h2 {
    margin-bottom: 70px;
  }

  .btn {
    margin: 0 auto;
    margin-top: 60px;
  }
}

@media (max-width: 800px) {
  .hero {
    padding-top: 60px;
  }
  .cats {
    grid-gap: 15px;
    grid-template-columns: 1fr 1fr;
    display: grid;
    grid-auto-rows: 250px;

    .cat-card {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      align-items: center;
      min-height: 250px;
      width: auto;
      border-radius: 15px;
      padding: 20px 8px;
      gap: 20px;

      h4 {
        max-width: 100%;
        font-size: 14px;
      }
    }
  }

  .popular {
    padding-top: 80px;
    text-align: center;
    margin-bottom: 80px;

    h2 {
      margin-bottom: 40px;
    }
  }

  .accessories {
    padding-top: 80px;
    text-align: center;
    border-radius: 0;
    border: none;
    padding: 0;
    margin-bottom: 80px;

    h2 {
      margin-bottom: 40px;
    }

    .btn {
      margin: 0 auto;
      margin-top: 40px;
    }
  }
}
</style>
