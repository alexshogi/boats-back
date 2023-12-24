<template>
  <v-container
    ref="page"
    class="catalog-page"
  >
    <header class="catalog-page-header">
      <h1>Каталог / {{ catTitle }}</h1>

      <div class="catalog-page-header-actions">
        <v-select
          v-model="sort"
          :items="sortItems"
          placeholder="Сортировка"
          outlined
          hide-details
          style="max-width: 250px; cursor: pointer;"
        />

        <v-btn
          dark
          icon
          class="btn-filters-mobile"
          @click="showFiltersMobile = true"
        >
          <v-icon>mdi-tune</v-icon>
        </v-btn>
      </div>
    </header>
    
    <div class="catalog-page-container">
      <!-- <div class="filters">
        <h4>Цена</h4>
        <div class="filter-block">
          <v-text-field
            v-model="minPrice"
            :placeholder="`от ${minPrice.toLocaleString()}`"
            outlined
            type="number"
            hide-details
            class="mb-4"
            @input="getGoods()"
          />

          <v-text-field
            v-model="maxPrice"
            :placeholder="`до ${maxPrice.toLocaleString()}`"
            outlined
            type="number"
            hide-details
            @input="getGoods()"
          />
        </div>

        <h4>Объем памяти</h4>
        <div class="filter-block memory-block">
          <v-radio-group
            v-model="selectedMemory"
            column
          >
            <v-radio
              label="64 ГБ"
              value="64"
            />
            <v-radio
              label="128 ГБ"
              value="128"
            />
            <v-radio
              label="256 ГБ"
              value="256"
            />
            <v-radio
              label="512 ГБ"
              value="512"
            />
            <v-radio
              label="1 ТБ"
              value="1024"
            />
            <v-radio
              label="2 ТБ"
              value="2048"
            />
          </v-radio-group>
        </div>

        <h4>Цвет</h4>
        <div class="filter-block">
          <v-radio-group
            v-model="color"
            column
          >
            <v-radio
              label="красный"
              value="красный"
            />
            <v-radio
              label="оранжевый"
              value="оранжевый"
            />
            <v-radio
              label="желтый"
              value="желтый"
            />
            <v-radio
              label="зеленый"
              value="зеленый"
            />
            <v-radio
              label="голубой"
              value="голубой"
            />
            <v-radio
              label="синий"
              value="синий"
            />
            <v-radio
              label="фиолетовый"
              value="фиолетовый"
            />
            <v-radio
              label="черный"
              value="черный"
            />
            <v-radio
              label="серый"
              value="серый"
            />
            <v-radio
              label="белый"
              value="белый"
            />
          </v-radio-group>
        </div>
      </div> -->

      <div class="catalog-page-content">
        <section v-if="loading" class="catalog-container">
          <v-skeleton-loader
            v-for="i in 12"
            :key="i"
            type="image, article, actions"
            class="product-card"
          />
        </section>
        <section v-if="!loading && !mockGoods.length">
          <p>Таких товаров сейчас нет</p>
          <p>Попробуйте заглянуть в другую категорию или поменять фильтры</p>
        </section>

        <section v-if="!loading && mockGoods.length && !searchResults.length" class="catalog-container">
          <NuxtLink
            v-for="item in mockGoods"
            :key="item.id"
            :to="`/catalog/${item.link}`"
            class="text-decoration-none"
          >
            <ProductCard
              :product="item"
            />
          </NuxtLink>
        </section>

        <section v-if="!loading && searchResults.length" class="catalog-container">
          <NuxtLink
            v-for="item in searchResults"
            :key="item.id"
            :to="`/catalog/${item.link}`"
            class="text-decoration-none"
          >
            <ProductCard
              :product="item"
            />
          </NuxtLink>
        </section>

        <section
          v-if="paginationLength"
          class="pagination"
        >
          <v-pagination
            v-model="pagination.page"
            class="my-4"
            elevation="0"
            :length="paginationLength"
            :total-visible="11"
          />
        </section>
      </div>
    </div>

    <v-navigation-drawer
      v-model="showFiltersMobile"
      absolute
      top
      temporary
      class="filters-mobile"
    >
      <div class="filters-mobile-header">
        <NuxtLink
          to="/"
          class="text-decoration-none"
        >
          <div class="site-logo">
            <h3>iPlatinum</h3>
            <p>Store and Service</p>
          </div>
        </NuxtLink>

        <v-btn
          dark
          icon
          class="btn-menu-mobile"
          @click="showFiltersMobile = false"
        >
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </div>
      <div class="filters">
        <h4>Цена</h4>
        <div class="filter-block">
          <v-text-field
            v-model="minPrice"
            :placeholder="`от ${minPrice.toLocaleString()}`"
            outlined
            type="number"
            hide-details
            class="mb-4"
            @input="getGoods()"
          />

          <v-text-field
            v-model="maxPrice"
            :placeholder="`до ${maxPrice.toLocaleString()}`"
            outlined
            type="number"
            hide-details
            @input="getGoods()"
          />
        </div>

        <h4>Объем памяти</h4>
        <div class="filter-block memory-block">
          <v-radio-group
            v-model="selectedMemory"
            column
          >
            <v-radio
              label="64 ГБ"
              value="64"
            />
            <v-radio
              label="128 ГБ"
              value="128"
            />
            <v-radio
              label="256 ГБ"
              value="256"
            />
            <v-radio
              label="512 ГБ"
              value="512"
            />
            <v-radio
              label="1 ТБ"
              value="1024"
            />
            <v-radio
              label="2 ТБ"
              value="2048"
            />
          </v-radio-group>
        </div>

        <h4>Цвет</h4>
        <div class="filter-block">
          <v-radio-group
            v-model="color"
            column
          >
            <v-radio
              label="красный"
              value="красный"
            />
            <v-radio
              label="оранжевый"
              value="оранжевый"
            />
            <v-radio
              label="желтый"
              value="желтый"
            />
            <v-radio
              label="зеленый"
              value="зеленый"
            />
            <v-radio
              label="голубой"
              value="голубой"
            />
            <v-radio
              label="синий"
              value="синий"
            />
            <v-radio
              label="фиолетовый"
              value="фиолетовый"
            />
            <v-radio
              label="черный"
              value="черный"
            />
            <v-radio
              label="серый"
              value="серый"
            />
            <v-radio
              label="белый"
              value="белый"
            />
          </v-radio-group>
        </div>
      </div>

      <v-btn
        color="primary"
        class="btn btn-primary"
        depressed
        @click="showFiltersMobile = false"
      >
        Применить
      </v-btn>
    </v-navigation-drawer>
  </v-container>
</template>

<script>
import { mapGetters } from 'vuex';
import ProductCard from '@/components/goods/ProductCard.vue';
import Icon from '@/components/Icon.vue';

export default {
  name: 'CatalogPage',
  components: {
    ProductCard,
    Icon,
  },
  data () {
    return {
      categories: [{
        id: 'all',
        code: 'all',
        title: 'Все',
      }],
      subCategories: [],
      category: '',
      active: [{ id: 'all' }],
      showCards: true,
      showRows: false,
      goods: [],
      loading: true,
      pagination: {
        page: 1,
        itemsPerPage: 20,
        total: 0,
      },
      minPrice: 1,
      maxPrice: 399000,
      selectedMemory: '',
      color: '',
      showFiltersMobile: false,
      sort: '',
      sortItems: [
        {
          text: 'Сначала дешевле',
          value: 'priceAsc',
        },
        {
          text: 'Сначала дороже',
          value: 'priceDesc',
        }
      ],
      mockGoods: [
        {
          id: 'fdf8d989f9dferef00df',
          link: '',
          image: {
            image: {
              url: 'https://lodki-lodki.ru/images/product_images/popup_images/2024_0.png',
            },
          },
          title: 'Алюминиевая лодка Тактика 430 DC',
          price: 19990,
          oldPrice: 23990,
          bonus: 199,
          vendorCode: 'sds222',
          rating: 4,
          ratings: 27,
        },
        {
          id: 'fdf8d989f9dferef00d1',
          link: '',
          image: {
            image: {
              url: 'https://lodki-lodki.ru/images/product_images/popup_images/2024_0.png',
            },
          },
          title: 'Алюминиевая лодка Тактика 430 DC',
          price: 19990,
          bonus: 199,
          vendorCode: 'sds223',
          rating: 5,
          ratings: 22,
        },
        {
          id: 'fdf8d989f9dferef00d2',
          link: '',
          image: {
            image: {
              url: 'https://lodki-lodki.ru/images/product_images/popup_images/2024_0.png',
            },
          },
          title: 'Алюминиевая лодка Тактика 430 DC',
          price: 19990,
          oldPrice: 26990,
          bonus: 199,
          vendorCode: 'sds224',
          rating: 5,
          ratings: 7,
        },
        {
          id: 'fdf8d989f9dferef00d3',
          link: '',
          image: {
            image: {
              url: 'https://lodki-lodki.ru/images/product_images/popup_images/2024_0.png',
            },
          },
          title: 'Алюминиевая лодка Тактика 430 DC',
          price: 19990,
          bonus: 199,
          vendorCode: 'sds225',
          rating: 5,
          ratings: 44,
        },
        {
          id: 'fdf8d989f9dferef00d4',
          link: '',
          image: {
            image: {
              url: 'https://lodki-lodki.ru/images/product_images/popup_images/2024_0.png',
            },
          },
          title: 'Алюминиевая лодка Тактика 430 DC',
          price: 19990,
          oldPrice: 21490,
          bonus: 199,
          vendorCode: 'sds226',
          rating: 5,
          ratings: 27,
        },
        {
          id: 'fdf8d989f9dferef00d5',
          link: '',
          image: {
            image: {
              url: 'https://lodki-lodki.ru/images/product_images/popup_images/2024_0.png',
            },
          },
          title: 'Алюминиевая лодка Тактика 430 DC',
          price: 19990,
          bonus: 199,
          vendorCode: 'sds227',
          rating: 5,
          ratings: 3,
        },
      ],
    }
  },
  computed: {
    ...mapGetters({
      searchResults: 'searchResults',
    }),
    paginationLength () {
      return Math.round(this.pagination.total / this.pagination.itemsPerPage);
    },
    catTitle () {
      if (this.category === 'all') {
        return 'Все товары';
      }

      const cat = this.categories.find(c => c.code === this.category);
      const subCat = this.subCategories.find(c => c.code === this.category);

      return subCat?.title || cat?.title || '';
    },
  },
  watch: {
    "pagination.page" () {
      this.getGoods();
      window.scrollTo({ top: 0, behavior: 'smooth' });
    },
    category () {
      this.getGoods();
      window.scrollTo({ top: 0, behavior: 'smooth' });
    },
    $route (to) {
      this.category = to?.query?.category || 'all';
    },
    sort () {
      this.getGoods();
    },
    selectedMemory () {
      this.getGoods();
    },
    color () {
      this.getGoods();
    },
  },
  async mounted () {
    this.category = this.$route.query?.category || 'all';

    await this.getGoods();
    await this.getCats();
    await this.getSubCats();

    this.getMinPrice();
    this.getMaxPrice();
  },
  methods: {
    openGoodsItem (id) {
      this.$router.push({ path: `catalog/${id}` });
    },
    async getMinPrice () {
      const graphqlQuery = {
        query: `
          query {
            products(take: 1, orderBy: { price: asc }) {
              id
              title
              price
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });

      if (response?.data?.data?.products) {
        this.minPrice = response.data.data.products[0].price;
      }
    },
    async getMaxPrice () {
      const graphqlQuery = {
        query: `
          query {
            products(take: 1, orderBy: { price: desc }) {
              id
              title
              price
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });

      if (response?.data?.data?.products) {
        this.maxPrice = response.data.data.products[0].price;
      }
    },
    async getGoods () {
      this.loading = true;

      let queryString = '';

      // if (!this.color) {
      //   queryString += `{ defaultcolor: { equals: true } }`;
      // }

      queryString += `{ title: { contains: "${this.selectedMemory}" } }`;

      queryString += `{ price: { gte: ${Number(this.minPrice)} } }`;
      queryString += `{ price: { lte: ${Number(this.maxPrice)} } }`;

      let catString = '';

      if (this.category !== 'all') {
        catString += `{ category: { code: { equals: "${this.category}" } } }`;
        catString += `{ subCategory: { code: { equals: "${this.category}" } } }`;
      }

      if (this.color) {
        queryString += `{ title: { contains: "${this.color}" } }`;
      }

      let sortString = '';

      if (this.sort) {
        sortString += `{ price: ${ this.sort === 'priceDesc' ? 'desc' : 'asc' } }`;
      }

      const graphqlQuery = {
        query: `
          query {
            productsCount(
              where: {
                AND: [
                  ${queryString}
                ]
                OR: [
                  ${catString}
                ]
              }
            ),
            products(
              orderBy: [${sortString}],
              take: ${this.pagination.itemsPerPage},
              skip: ${this.pagination.itemsPerPage * this.pagination.page - this.pagination.itemsPerPage},
              where: {
                AND: [
                  ${queryString}
                ]
                OR: [
                  ${catString}
                ]
              }
            ) {
              id
              link
              title
              price
              bonus
              isActive
              vendorCode
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
        this.goods = response.data.data.products;
      }

      if (response?.data?.data?.productsCount) {
        this.pagination.total = response.data.data.productsCount;
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
              children {
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

      if (response?.data?.data?.categories) {
        this.categories = [ ...this.categories, ...response.data.data.categories ];
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
        this.subCategories = [ ...this.subCategories, ...response.data.data.subCategories ];
      }

      this.loading = false;
    },
  }
}
</script>

<style scoped>
.catalog-page {
  padding-top: 80px;
}

.catalog-page-header {
  margin-bottom: 70px;
  display: flex;
  flex-direction: row;
  gap: 30px;
  align-items: center;
  justify-content: space-between;
  width: 100%;
}

.catalog-page-header-actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.catalog-page-container {
  display: flex;
  flex-direction: row;
  gap: 30px;
  align-items: flex-start;
}

.catalog-page .filters {
  width: 170px;
  min-width: 170px;
  max-width: 170px;
}

.catalog-page .filters .filter-block {
  margin-bottom: 40px;
}

.catalog-page .filters h4 {
  margin-bottom: 16px;
}

.catalog-container {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 90px 30px;
  margin-bottom: 70px;
  width: 100%;
}
.btn-filters-mobile {
  display: none;
}
@media (max-width: 800px) {
  .btn-filters-mobile {
    display: block;
  }
  .catalog-page-header {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 15px;
    margin-bottom: 30px;
  }
  .catalog-page-header-actions {
    width: 100%;
  }
  .catalog-page-header h1 {
    font-size: 20px;
    text-align: left;
  }
  .catalog-page .filters {
    display: none;
  }
  .filters-mobile {
    width: 100vw !important;
    height: 100vh !important;
    position: fixed !important;
    top: 0;
    left: 0;
    z-index: 20000;
    padding: 24px 12px;
    background-color: #111111;
  }
  .filters-mobile-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 50px;
  }
  .filters-mobile .filters {
    display: block;
    overflow-y: auto;
  }
  .catalog-page {
    padding: 25px 0;
    display: flex;
    flex-direction: column;
    gap: 30px;
    align-items: flex-start;
  }
  .catalog-page-content {
    max-width: 100%;
    width: 100%;
  }
  .catalog-container {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 30px 15px;
    margin-bottom: 40px;
  }
  .catalog-container .product-card .product-info h4 {
    font-size: 14px;
    line-height: 16px;
    font-weight: 400;
    margin-bottom: 15px;
    min-height: 48px;
    height: 48px;
    max-height: 48px;
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

.theme--dark.v-pagination .v-pagination__item--active {
  color: #111111;
}

.catalog-page .v-input__control > .v-input__slot {
  align-items: stretch;
  min-height: 42px;
}

.catalog-page .memory-block .v-input__control > .v-input__slot {
  align-items: stretch;
  min-height: 28px;
}

.catalog-page .catalog-page-header .v-input * {
  cursor: pointer;
}

.catalog-page .catalog-page-header .v-input__append-inner {
  margin-top: 13px;
}
</style>
