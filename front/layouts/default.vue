<template>
  <v-app style="background-color: #e8e8e8;">
    <v-system-bar
      height="100"
      fixed
      class="header-top"
      style="background-color: #e8e8e8; z-index: 15000; transition: top 0.1s;"
      :style="systemBarStyle"
    >
      <v-container class="d-flex justify-space-between align-center">
        <nav>
          <NuxtLink
            to="/dostavka-i-oplata"
            class="header-nav-link"
          >
            Доставка и оплата
          </NuxtLink>
          <NuxtLink
            to="/garantiya"
            class="header-nav-link"
          >
            Гарантия
          </NuxtLink>
          <NuxtLink
            to="/kontakty"
            class="header-nav-link"
          >
            Контакты
          </NuxtLink>
        </nav>

        <NuxtLink
          to="/"
          class="text-decoration-none"
        >
          <div class="site-logo">
            <img
              src="../static/images/logo.png"
              alt="Тактика"
              width="223"
              height="49"
            >
          </div>
        </NuxtLink>

        <v-menu
          bottom
          nudge-bottom="54"
          open-on-hover
          close-delay="400"
        >
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              color="primary"
              class="btn btn-transparent"
              depressed
              v-bind="attrs"
              v-on="on"
              id="header-btn-catalog"
            >
              О производстве
              <Icon
                icon="chevron-down"
                size="18"
              />
            </v-btn>
          </template>

          <div class="d-flex categories-menu">
            <v-list>
              <NuxtLink
                to="/o-proizvodstve"
                class="text-decoration-none"
              >
                <v-list-item>
                  <v-list-item-title>О компании</v-list-item-title>
                </v-list-item>
              </NuxtLink>
              <NuxtLink
                to="/nasha-komanda"
                class="text-decoration-none"
              >
                <v-list-item>
                  <v-list-item-title>Наша команда</v-list-item-title>
                </v-list-item>
              </NuxtLink>
              <NuxtLink
                to=""
                class="text-decoration-none"
              >
                <v-list-item>
                  <v-list-item-title>Сертификаты</v-list-item-title>
                </v-list-item>
              </NuxtLink>
              <NuxtLink
                to="/blagodarnosti"
                class="text-decoration-none"
              >
                <v-list-item>
                  <v-list-item-title>Благодарственные письма</v-list-item-title>
                </v-list-item>
              </NuxtLink>
              <NuxtLink
                to=""
                class="text-decoration-none"
              >
                <v-list-item>
                  <v-list-item-title>Видео и фото производства</v-list-item-title>
                </v-list-item>
              </NuxtLink>
              <NuxtLink
                to=""
                class="text-decoration-none"
              >
                <v-list-item>
                  <v-list-item-title>Развитие города</v-list-item-title>
                </v-list-item>
              </NuxtLink>
            </v-list>
          </div>
        </v-menu>

        <div class="header-top-actions">
          <a href="tel:+79527995333" class="text-decoration-none">
            <v-btn
              color="primary"
              class="btn medium btn-primary btn-header-phone"
              depressed
            >
              +7 (911) 495-24-88
            </v-btn>
          </a>

          <v-btn
            color="primary"
            class="btn small btn-secondary btn-order-call"
            depressed
            @click=""
          >
            Заказать звонок
          </v-btn>

          <div class="d-flex justify-space-between align-center">
            <a @click.prevent="">
              Задать вопрос
            </a>
            <a
              href="mailto:info@tactic-boat.ru"
              class="text-decoration-none d-flex align-center"
            >
              <img
                src="../static/images/mail.svg"
                alt="mail"
                height="14"
              >
            </a>
            <a
              href="https://t.me/+79229491631"
              target="_blank"
              class="text-decoration-none d-flex align-center"
            >
              <img
                src="../static/images/telegram.png"
                alt="tg"
                height="14"
              >
            </a>
            <a
              href="whatsapp://send?phone=79229491631"
              target="_blank"
              class="text-decoration-none d-flex align-center"
            >
              <img
                src="../static/images/whatsapp.png"
                alt="wa"
                height="14"
              >
            </a>
          </div>
        </div>

        <v-btn
          dark
          icon
          class="btn-menu-mobile"
          @click="drawer = true"
        >
          <v-icon>mdi-menu</v-icon>
        </v-btn>
      </v-container>
    </v-system-bar>

    <v-navigation-drawer
      v-model="drawer"
      absolute
      top
      temporary
      class="navigation-mobile"
    >
      <div class="navigation-mobile-header">
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
          @click="drawer = false"
        >
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </div>
      
      <nav>
        <NuxtLink
          to="/delivery"
          class="header-nav-link"
        >
          Доставка и оплата
        </NuxtLink>
        <NuxtLink
          to="/credit"
          class="header-nav-link"
        >
          Кредит
        </NuxtLink>
        <NuxtLink
          to="/guarantee"
          class="header-nav-link"
        >
          Гарантия
        </NuxtLink>
        <NuxtLink
          to="/trade-in"
          class="header-nav-link"
        >
          Trade In
        </NuxtLink>
        <NuxtLink
          to="/about"
          class="header-nav-link"
        >
          О нас
        </NuxtLink>
        <NuxtLink
          to="/reviews"
          class="header-nav-link"
        >
          Отзывы
        </NuxtLink>
      </nav>

      <h2 class="mt-5 mb-4 ml-5 pt-5">Каталог</h2>

      <v-expansion-panels>
        <v-expansion-panel
          v-for="c in categories"
          :key="c.id"
          v-if="c.code !== 'all'"
        >
          <v-expansion-panel-header>
            {{ c.title }}
          </v-expansion-panel-header>
          <v-expansion-panel-content>
            <v-card
              v-for="sc in subCategories"
              :key="sc.id"
              v-if="sc.parent.id === c.id"
              class="pa-2 scat-card"
              flat
            >
              <NuxtLink :to="`/catalog?category=${sc.code}`">
                <h4 class="mb-3">{{ sc.title }}</h4>
              </NuxtLink>
            </v-card>
          </v-expansion-panel-content>
        </v-expansion-panel>
      </v-expansion-panels>

      <NuxtLink
        to="/catalog"
        class="text-decoration-none"
      >
        <v-btn
          color="primary"
          class="btn btn-primary"
          depressed
        >
          Каталог
        </v-btn>
      </NuxtLink>

      <div class="nav-actions">
        <div class="nav-action-btn">
          <NuxtLink
            to="/wishlist"
            class="icon-text-link"
          >
            <v-badge
              v-if="favoritesProductsAmount"
              :content="favoritesProductsAmount"
            >
              <Icon
                icon="heart"
                size="22"
              />
            </v-badge>
            <Icon
              v-else
              icon="heart"
              size="22"
            />
            <span class="icon-text">Избранное</span>
          </NuxtLink>
        </div>

        <div class="nav-action-btn">
          <NuxtLink
            to="/wishlist"
            class="icon-text-link"
          >
            <Icon
              icon="compare"
              size="22"
            />
            <span class="icon-text">Сравнить</span>
          </NuxtLink>
        </div>
        
        <div class="nav-action-btn">
          <NuxtLink
            to="/cart"
            class="icon-text-link"
          >
            <v-badge
              v-if="cartProductsAmount"
              :content="cartProductsAmount"
            >
              <Icon
                icon="bag"
                size="22"
              />
            </v-badge>
            <Icon
              v-else
              icon="bag"
              size="22"
            />
            <span class="icon-text text--gray">Корзина</span>
          </NuxtLink>
        </div>

        <div class="nav-action-btn">
          <NuxtLink
            to="/my-account"
            class="icon-text-link"
          >
            <Icon
              icon="person"
              size="22"
            />
            <span class="icon-text">Личный кабинет</span>
          </NuxtLink>
        </div>
      </div>
    </v-navigation-drawer>

    <v-app-bar
      app
      elevation="0"
      fixed
      style="height: 100px; top: 100px; z-index: 15000; background-color: rgba(232, 232, 232, 0.8); backdrop-filter: blur(10px);"
      :style="appBarStyle"
    >
      <v-container class="d-flex justify-space-between align-center">
        <v-menu
          bottom
          attach=".v-app-bar"
          nudge-bottom="54"
        >
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              color="primary"
              class="btn btn-primary"
              depressed
              v-bind="attrs"
              v-on="on"
              id="header-btn-catalog"
            >
              Каталог
              <Icon
                icon="chevron-down"
                size="18"
              />
            </v-btn>
          </template>

          <div class="d-flex categories-menu">
            <v-list>
              <NuxtLink
                v-for="c in categories"
                :key="c.id"
                :to="`/catalog?category=${c.code}`"
                style="text-decoration: none;"
                v-if="c.code !== 'services'"
              >
                <v-list-item>
                  <v-list-item-title>{{ c.title }}</v-list-item-title>
                </v-list-item>
              </NuxtLink>
            </v-list>
          </div>
        </v-menu>

        <div
          class="d-flex header-search-field"
        >
          <v-text-field
            v-model="searchString"
            dense
            height="46"
            hide-details
            placeholder="Поиск по сайту"
            class="search-input"
            @input="search()"
          />
          <Icon
            icon="search"
            size="17"
            @click="search()"
            style="position: absolute; top: 16px; right: 16px; z-index: 30;"
          />
          <v-card
            v-show="showResults"
            v-click-outside="hideResults"
            max-width="800"
            class="mx-auto search-results"
            style="position: absolute; top: 75px;"
          >
            <v-list three-line>
              <NuxtLink
                v-for="item in searchResults"
                :key="item.id"
                :to="`/catalog/${item.link}`"
                class="search-item"
              >
                <v-list-item
                  @click="clearSearchResults()"
                >
                  <v-list-item-avatar>
                    <div
                      class="goods-image"
                      :style="`background-image: url(${item.image?.image?.url})`"
                    />
                  </v-list-item-avatar>

                  <v-list-item-content>
                    <v-list-item-title>
                      {{ item.title }}
                    </v-list-item-title>
                    <v-list-item-subtitle>
                      {{ item.caption }}
                    </v-list-item-subtitle>
                  </v-list-item-content>
                </v-list-item>
              </NuxtLink>
            </v-list>
          </v-card>
        </div>
        <div class="nav-actions">
          <div class="nav-action-btn">
            <NuxtLink
              to="/wishlist"
              class="icon-text-link"
            >
              <v-badge
                v-if="favoritesProductsAmount"
                :content="favoritesProductsAmount"
              >
                <Icon
                  icon="heart"
                  size="22"
                />
              </v-badge>
              <Icon
                v-else
                icon="heart"
                size="22"
              />
              <span class="icon-text">Избранное</span>
            </NuxtLink>
          </div>

          <div class="nav-action-btn">
            <NuxtLink
              to="/compare-products"
              class="icon-text-link"
            >
              <Icon
                icon="compare"
                size="22"
              />
              <span class="icon-text">Сравнить</span>
            </NuxtLink>
          </div>
          
          <div class="nav-action-btn">
            <NuxtLink
              to="/cart"
              class="icon-text-link"
            >
              <v-badge
                v-if="cartProductsAmount"
                :content="cartProductsAmount"
              >
                <Icon
                  icon="bag"
                  size="22"
                />
              </v-badge>
              <Icon
                v-else
                icon="bag"
                size="22"
              />
              <span class="icon-text">Корзина</span>
            </NuxtLink>
          </div>

          <div class="nav-action-btn">
            <NuxtLink
              to="/my-account"
              class="icon-text-link"
            >
              <Icon
                icon="person"
                size="22"
              />
              <span class="icon-text">Личный кабинет</span>
            </NuxtLink>
          </div>
        </div>
      </v-container>
    </v-app-bar>

    <v-main>
      <v-container>
        <Nuxt />
      </v-container>
    </v-main>

    <!-- <v-footer class="site-footer">
      <v-container class="d-flex justify-space-between">
        <section>
          <div class="site-logo">
            <h3>iPlatinum</h3>
            <p>Store and Service</p>
          </div>
          <div class="socials">
            <a href="https://vk.com/iplatinumstoreservice39" target="_blank">
              <img src="../static/images/icon-vk.svg" alt="VK">
            </a>
            <a href="https://t.me/iPlatinumStore" target="_blank">
              <img src="../static/images/icon-telegram.svg" alt="TG">
            </a>
            <a class="link-instagram" href="https://www.instagram.com/iplatinum_service/" target="_blank">
              <img src="../static/images/icon-instagram.svg" alt="IG">
            </a>
            <a href="https://www.avito.ru/brands/i163601381/" target="_blank">
              <img src="../static/images/icon-avito.svg" alt="Avito">
            </a>
            <p class="note">
              * Instagram — проект Meta Platforms Inc.,
              <br>
              деятельность которой в России запрещена
            </p>
          </div>
        </section>
        <section>
          <nav>
            <NuxtLink
              to="/delivery"
              class="header-nav-link"
            >
              Доставка и оплата
            </NuxtLink>
            <NuxtLink
              to="/credit"
              class="header-nav-link"
            >
              Кредит
            </NuxtLink>
            <NuxtLink
              to="/guarantee"
              class="header-nav-link"
            >
              Гарантия
            </NuxtLink>
            <NuxtLink
              to="/trade-in"
              class="header-nav-link"
            >
              Trade In
            </NuxtLink>
            <NuxtLink
              to="/about"
              class="header-nav-link"
            >
              О нас
            </NuxtLink>
            <NuxtLink
              to="/reviews"
              class="header-nav-link"
            >
              Отзывы
            </NuxtLink>
            <NuxtLink
              to="/"
              class="header-nav-link"
            >
              Контакты
            </NuxtLink>
          </nav>
          <NuxtLink
            to="/privacy-policy"
            class="link-underline"
          >
            Политика конфиденциальности
          </NuxtLink>
        </section>
        <section>
          <a href="tel:+79527995333">+7 (952) 799-53-33</a>

          <v-menu
            top
            :offset-y="true"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-btn
                color="primary"
                class="btn btn-primary"
                depressed
                v-bind="attrs"
                v-on="on"
              >
                Каталог
              </v-btn>
            </template>

            <v-list class="categories-menu">
              <NuxtLink
                v-for="c in categories"
                :key="c.id"
                :to="`/catalog?category=${c.code}`"
                style="text-decoration: none;"
              >
                <v-list-item>
                  <v-list-item-title>{{ c.title }}</v-list-item-title>
                </v-list-item>
              </NuxtLink>
            </v-list>
          </v-menu>

          <a href="https://service.iplatinum.ru/" class="link-underline" target="_blank">Сервисный центр</a>
        </section>
      </v-container>
    </v-footer>
    <v-bottom-navigation
      fixed
      hide-on-scroll
      horizontal
    >
      <div class="nav-action-btn">
        <NuxtLink
          to="/"
          class="icon-text-link"
        >
          <Icon
            icon="logo"
            size="16"
          />
          <span class="icon-text">Главная</span>
        </NuxtLink>
      </div>

      <div class="nav-action-btn">
        <NuxtLink
          to="/wishlist"
          class="icon-text-link"
        >
          <v-badge
            v-if="favoritesProductsAmount"
            :content="favoritesProductsAmount"
          >
            <Icon
              icon="heart"
              size="16"
            />
          </v-badge>
          <Icon
            v-else
            icon="heart"
            size="16"
          />
          <span class="icon-text">Избранное</span>
        </NuxtLink>
      </div>

      <div class="nav-action-btn">
        <NuxtLink
          to="/catalog"
          class="icon-text-link"
        >
          <Icon
            icon="search"
            size="16"
          />
          <span class="icon-text">Каталог</span>
        </NuxtLink>
      </div>
      
      <div class="nav-action-btn">
        <NuxtLink
          to="/cart"
          class="icon-text-link"
        >
          <v-badge
            v-if="cartProductsAmount"
            :content="cartProductsAmount"
          >
            <Icon
              icon="bag"
              size="16"
            />
          </v-badge>
          <Icon
            v-else
            icon="bag"
            size="16"
          />
          <span class="icon-text">Корзина</span>
        </NuxtLink>
      </div>

      <div class="nav-action-btn">
        <NuxtLink
          to="/my-account"
          class="icon-text-link"
        >
          <Icon
            icon="person"
            size="16"
          />
          <span class="icon-text">Личный кабинет</span>
        </NuxtLink>
      </div>
    </v-bottom-navigation> -->
  </v-app>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import Icon from '@/components/Icon.vue';

export default {
  name: 'DefaultLayout',
  components: {
    Icon,
  },
  data () {
    return {
      scroll: false,
      searchString: '',
      searchResults: [],
      showResults: false,
      categories: [],
      subCategories: [],
      defaultCategories: [{
        id: 'all',
        code: 'all',
        title: 'Все',
      }],
      drawer: false,
      activeCatCode: '',
      activeSubCatCode: '',
    }
  },
  computed: {
    ...mapGetters({
      user: 'user',
      authorised: 'authorised',
      cartProductsAmount: 'cartProductsAmount',
      favoritesProductsAmount: 'favoritesProductsAmount',
    }),
    systemBarStyle () {
      if (process.browser) {
        const width = window.innerWidth;

        if (width > 800) {
          return `top: ${this.scroll ? '-100' : '0'}px`;
        } else {
          return `top: ${this.scroll ? '0' : '0'}px`;
        }
      }
      
      return `top: ${this.scroll ? '-100' : '0'}px`;
    },
    appBarStyle () {
      if (process.browser) {
        const width = window.innerWidth;

        if (width > 800) {
          return `top: ${this.scroll ? '0' : '100'}px`;
        } else {
          return `top: ${this.scroll ? '-100' : '100'}px`;
        }
      }

      return `top: ${this.scroll ? '0' : '100'}px`;
    },
    showSubCats() {
      return this.activeCatCode;
    },
    subCatsToShow() {
      return this.subCategories.filter(cat => cat.parent?.code === this.activeCatCode);
    },
  },
  created () {
    if (process.browser) {
      window.addEventListener('scroll', this.handleScroll);
    }
  },
  async mounted () {
    this.checkAuth();

    await this.getCart();
    await this.getCats();
    await this.getSubCats();
  },
  unmounted () {
    if (process.browser) {
      window.removeEventListener('scroll', this.handleScroll);
    }
  },
  methods: {
    ...mapActions({
      setAuth: 'login',
      logout: 'logout',
      setCart: 'setCart',
      setSearchResults: 'setSearchResults',
    }),
    handleScroll () {
      if (process.browser) {
        if (window.scrollY > 100) {
          this.scroll = true;
        } else {
          this.scroll = false;
        }
      }
    },
    checkAuth () {
      const auth = localStorage.getItem('auth');

      if (auth && auth !== 'null') {
        this.setAuth(JSON.parse(auth));
      }
    },
    clearSearchResults () {
      this.showResults = false;
    },
    hideResults () {
      this.showResults = false;
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
        this.categories = [ ...this.defaultCategories, ...response.data.data.categories ];
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
        this.subCategories = [ ...response.data.data.subCategories ];
      }

      this.loading = false;
    },
    async search () {
      this.loading = true;

      const graphqlQuery = {
        query: `
          query {
            products (
              take: 30,
              where: {
                OR: [
                  { title: { contains: "${this.searchString}" } }
                  { caption: { contains: "${this.searchString}" } }
                  { description: { contains: "${this.searchString}" } }
                ]
                AND: [
                  { isActive: { equals: true } }
                ]
              }
            ) {
              id
              link
              title
              bonus
              price
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
        if (this.$route.name === 'catalog') {
          this.setSearchResults(response.data.data.products);
        } else {
          this.searchResults = response.data.data.products;
          this.showResults = true;
        }
      }

      this.loading = false;
    },
    async getCart () {
      const graphqlQuery = {
        query: `
          query {
            cart (
              where: {
                userId: "${this.user.id}"
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

      const cart = response?.data?.data?.cart;

      if (cart && cart.products) {
        cart.products = JSON.parse(cart.products.replace(/'/g, '"'));
        this.setCart(cart);
      }
    },
    doLogout () {
      this.logout();
      this.$router.push({ name: 'auth' });
    },
  }
}
</script>

<style>
.v-main {
  padding-top: 195px !important;
}

div.header-top {
  padding: 16px 8px 0;
}

div.header-top nav {
  display: flex;
  gap: 8px;
}

div.site-logo {
  color: #272727;
  display: flex;
  align-items: center;
  flex-direction: column;
  user-select: none;
}

div.site-logo h3 {
  font-family: 'Inter' !important;
  font-size: 22px;
  line-height: 26px;
  font-weight: 600;
}

div.site-logo p {
  font-size: 11.5px;
  font-weight: 400;
  margin: 0;
}

.header-nav-link {
  display: inline-flex;
  color: #272727 !important;
  font-size: 18px;
  line-height: 24px;
  padding: 4px 8px;
  text-decoration: none;
}

.icon-text-link {
  display: inline-flex;
  flex-direction: column;
  align-items: center;
  text-decoration: none;
}

.icon-text-link .icon {
  margin-bottom: 4px;
}

div.nav-actions {
  display: flex;
  gap: 30px;
}

div.nav-action-btn {
  display: flex;
  flex-direction: column;
  cursor: pointer;
}

div.nav-action-btn .icon {
  margin-bottom: 4px;
}

div.nav-action-btn span {
  font-size: 10px;
  white-space: nowrap;
}

.v-list.v-sheet {
  padding: 0;
}

div.categories-menu {
  border: 1px solid #e6e6e6 !important;
  border-radius: 15px !important;
  overflow: hidden;
}

div.categories-menu div.v-list {
  padding: 30px 20px !important;
  border-right: 1px solid #e6e6e6;
  max-height: 80vh;
  overflow-y: auto;
}

div.categories-menu div.v-list:last-of-type {
  border-right: none;
}

.categories-menu .cat-item {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  cursor: pointer;
  transition: all 0.2s;
  height: 40px !important;
}

.v-toolbar__content {
  min-height: 100%;
}

.search-input {
  border: 1px solid #979797;
  border-radius: 15px;
  padding-left: 18px;
  padding-right: 46px;
  height: 48px;
}

.search-input input {
  font-weight: 400;
  font-size: 18px;
  letter-spacing: normal;
  color: #BDBDBD;
}

.search-input .v-input__slot:before,
.search-input .v-input__slot:after {
  display: none;
}

div.divider-vertical {
  width: 1px;
  height: 24px;
  margin-top: 2px;
  background: #E0E0E0;
}

.search-results {
  max-height: 600px;
  overflow-y: auto;
}

.v-system-bar {
  font-style: normal;
  font-weight: 400;
  font-size: 12px;
  line-height: 20px;
  letter-spacing: 0.02em;
  color: #616161;
}

.v-bottom-navigation .v-badge__badge {
  color: #111111 !important;
  inset: auto auto calc(100% - 10px) calc(100% - 5px) !important;
}

.header-top-actions {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.header-top-actions > div {
  min-height: fit-content;
}

.v-menu__content {
  border-radius: 15px;
}

.v-list-item:hover {
  color: #FF343F !important;
}
</style>

<style scoped>
.goods-image {
  height: 100%;
  width: 100%;
  background-color: #ffffff;
  background-position: center;
  background-size: contain;
  background-repeat: no-repeat;
}

.search-item {
  text-decoration: none;
}

.search-item .v-list-item {
  transition: all 0.28s;
}

.search-item:hover .v-list-item {
  background-color: #3a3a3a !important;
}
.site-footer {
  padding: 35px 0;
  margin-top: 120px;
}
.site-footer nav {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}
.site-footer a.link-underline {
  text-underline-offset: 2px;
  margin-bottom: 10px;
}
.site-footer .site-logo {
  align-items: flex-start;
  padding-top: 2px;
}
.site-footer .socials {
  margin-top: 48px;
}
.site-footer .socials a {
  margin-right: 15px;
  text-decoration: none;
  display: inline-block;
}
.site-footer .socials a:last-of-type {
  margin-right: 0;
}
.site-footer .socials a img {
  height: 28px;
}
.site-footer .socials .note {
  font-size: 8px;
  line-height: 8px;
  margin-top: 5px;
  margin-bottom: 0;
}
.site-footer .socials a.link-instagram {
  position: relative;
  margin-right: 25px;
}
.site-footer .socials a.link-instagram:after {
  content: "*";
  position: absolute;
  top: 0;
  right: -10px;
  font-size: 18px;
}
.site-footer .container {
  justify-content: space-between;
}
.site-footer .container section:first-of-type {
  width: 250px;
}
.site-footer .container section:nth-child(2) {
  width: 400px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
}
.site-footer .container section:last-of-type {
  width: 250px;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  justify-content: space-between;
}
.site-footer .container section:last-of-type a:first-of-type {
  display: inline-block;
  font-size: 18px;
  line-height: 24px;
  font-weight: 600;
  padding-top: 4px;
}

.btn-menu-mobile {
  display: none;
}

.header-search-field {
  position: relative;
  margin: 0 80px;
  width: 100%;
  max-width: 470px;
}

.v-bottom-navigation {
  display: none;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  padding: 0 20px;
  background-color: #e6e6e6;
  color: #111111;
}

.v-bottom-navigation .icon,
.v-bottom-navigation .icon svg {
  color: #111111;
}

.v-bottom-navigation .icon-text {
  color: #111111;
}

.v-application .product-card:hover button.btn-fav .icon.active svg {
  color: rgb(228, 59, 59);
}

.v-application .product-card:hover button.btn-fav .icon.active svg path {
  color: rgb(228, 59, 59);
}

.menu-item-active {
  text-decoration: underline;
}

@media (max-width: 800px) {
  .v-bottom-navigation {
    display: flex;
  }
  .btn-menu-mobile {
    display: block;
  }
  #header-btn-catalog {
    display: none;
  }
  .navigation-mobile {
    width: 100vw !important;
    height: 100vh !important;
    position: fixed !important;
    top: 0;
    left: 0;
    z-index: 20000;
    padding: 24px 12px;
    background-color: #111111;
  }
  .navigation-mobile-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 50px;
  }
  .navigation-mobile nav {
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .navigation-mobile nav a {
    margin-bottom: 18px;
    font-size: 24px;
  }
  .navigation-mobile .btn {
    margin: 20px auto;
  }
  .navigation-mobile .v-expansion-panel,
  .navigation-mobile .scat-card,
  .navigation-mobile .sscat-card {
    background-color: #111111;
  }
  div.header-top nav {
    display: none;
    grid-gap: 8px;
    gap: 8px;
  }
  .header-search-field {
    position: relative;
    margin: 0;
    width: 100%;
    max-width: 100%;
    margin-right: 0;
  }
  .search-results {
    max-width: 100vw !important;
    left: -28px;
    position: absolute;
    top: 70px !important;
  }
  .nav-actions {
    display: none;
  }
  .navigation-mobile .nav-actions {
    display: flex;
    gap: 30px;
    justify-content: center;
    margin-top: 80px;
  }
  .btn-header-phone {
    display: none !important;
  }
  .site-footer {
    padding: 20px 0;
    margin-top: 80px;
  }
  .site-footer .container {
    display: flex;
    flex-direction: column;
    gap: 24px;
  }
  .site-footer .socials {
    margin-top: 24px;
  }
  .site-footer .container section:first-of-type {
    width: 100%;
  }
  .site-footer .container section:nth-child(2) {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: space-between;
  }
  .site-footer .container section:last-of-type {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: space-between;
    gap: 18px;
  }
  .site-footer .header-nav-link {
    padding-left: 0;
  }
  .site-footer nav {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    flex-direction: column;
  }
  .site-footer a.link-underline {
    display: inline-flex;
    color: #272727;
    font-size: 18px;
    line-height: 24px;
    padding: 4px 0;
  }
  div.header-top {
    padding: 0;
  }
}
</style>
