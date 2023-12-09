<template>
  <v-container class="common-page product-page">
    <section
      v-if="loading"
      class="product-container"
    >

    </section>
    <section
      v-else
      class="product-container"
    >
      <div class="slider slider-product">
        <div class="swiper swiper-product">
          <div class="swiper-wrapper">
            <div
              v-for="image in images"
              :key="image"
              class="swiper-slide"
            >
              <img
                :src="image"
                :alt="product.title"
                @click="openImage(image)"
              >
            </div>
          </div>
        </div>

        <div class="slider-button-prev">
          <Icon
            icon="chevron-left"
            size="16"
          />
        </div>
        <div class="slider-button-next">
          <Icon
            icon="chevron-right"
            size="16"
          />
        </div>
      </div>

      <div>
        <div class="product-header-actions">
          <v-btn
            class="btn btn-naked small"
            depressed
            @click.stop.prevent="addToFavorites"
          >
            <Icon
              icon="heart"
              size="17"
              :class="{ 'active': isProductInFavorites }"
            />
            {{ isProductInFavorites ? 'В&nbsp;избранном' : 'В&nbsp;избранное' }}
          </v-btn>

          <!-- <v-btn
            class="btn btn-naked small"
            depressed
          >
            <Icon
              icon="wallet"
              size="17"
            />
            Нашли дешевле?
          </v-btn> -->
        </div>
        <div class="product-bonus">
          <p v-if="product.bonus" class="bonus">+ {{ product.bonus?.toLocaleString() }} на счет</p>
          <p v-else class="bonus">+ {{ bonus.toLocaleString() }} на счет</p>
        </div>
        <div class="product-title">
          <h1>{{ product.title }}</h1>
        </div>
        <div class="product-vendor-code">
          <span>Артикул: {{ product.vendorCode }}</span>
        </div>
        <div class="product-color-picker">
          <span>Цвет:</span>
          <NuxtLink
            v-for="color in colors"
            :key="color.id"
            :to="`/catalog/${color.link}`"
            class="text-decoration-none"
          >
            <div
              class="color"
              :class="{ active: color.active }"
              :style="`background-color: ${colorsList[color.color]}`"
            ></div>
          </NuxtLink>
        </div>
        <div v-if="memoryAmounts?.length" class="product-memory-picker">
          <span>Объем памяти:</span>
          <NuxtLink
            v-for="ma in memoryAmounts"
            :key="ma.id"
            :to="`/catalog/${ma.link}`"
            class="text-decoration-none"
          >
            <div
              class="memory"
              :class="{ active: ma.active }"
            >
              {{ ma.memoryText }}
            </div>
          </NuxtLink>
        </div>

        <!-- <div class="product-connection-picker"></div> -->

        <div class="product-price">
          <span>{{ product.price?.toLocaleString() }} ₽</span>
        </div>
      </div>
    </section>

    <section class="product-actions">
      <div class="actions-left">
        <v-btn
          class="btn btn-outline"
          depressed
          @click="scrollToParams"
        >
          Характеристики
        </v-btn>
      </div>
      <div class="actions-right">
        <v-btn
          v-if="!isProductInCart"
          class="btn btn-primary"
          depressed
          @click.stop.prevent="addToCart"
        >
          В корзину
        </v-btn>
        <p
          v-if="isProductInCart"
          class="in-cart"
        >
          В корзине
        </p>
        <v-btn
          class="btn btn-outline"
          depressed
          @click="bottomForm = true"
        >
          Trade-In
        </v-btn>
      </div>
    </section>

    <section class="related-products">
      <h2 class="page-heading">С&nbsp;этим товаром покупают</h2>
      <SliderGoods
        v-if="relatedProductsToShow?.length"
        :products="relatedProductsToShow"
      />
    </section>

    <section class="services">
      <h2 class="page-heading">Полезные услуги</h2>
      <div class="services-container">
        <template v-if="services?.length">
          <ServiceCard
            v-for="service in services"
            :key="service.id"
            :service="service"
          />
        </template>
      </div>
    </section>

    <section
      ref="info"
      class="product-info product-info-desktop"
    >
      <v-tabs
        v-model="tab"
        align-with-title
      >
        <v-tab href="#description">
          Описание
        </v-tab>

        <v-tab href="#params">
          Характеристики
        </v-tab>

        <v-tab href="#delivery">
          Доставка и оплата
        </v-tab>

        <v-tab href="#guarantee">
          Гарантия
        </v-tab>

        <!-- <v-tab href="#services">
          Сервисы
        </v-tab> -->
      </v-tabs>

      <v-tabs-items v-model="tab">
        <v-tab-item :key="1" value="description">
          <div class="info-tab-container">
            <h4>{{ product.title }}</h4>
            {{ product.description }}
          </div>
        </v-tab-item>

        <v-tab-item :key="2" value="params">
          <div
            v-if="params"
            class="info-tab-container"
          >
            <h4>{{ product.title }}</h4>

            <section class="params-container">
              <div
                v-for="param in Object.keys(params)"
                :key="param"
                class="item"
              >
                <h4>{{ param }}</h4>
                <p v-if="(typeof params[param] === 'string')" v-html="params[param]"></p>
                <div v-else>
                  <p
                    v-for="nestedParam in Object.keys(params[param])"
                    :key="nestedParam"
                    class="params-row"
                  >
                    <template v-if="params[param][nestedParam] !== 'Нет данных'">
                      <span>{{ nestedParam }}: </span>
                      <span v-html="params[param][nestedParam]"></span>
                    </template>
                  </p>
                </div>
              </div>
            </section>
          </div>
        </v-tab-item>

        <v-tab-item :key="3" value="delivery">
          <div class="info-tab-container delivery-content">
            <p>Бесплатная доставка при заказе от 3 тысяч рублей.</p>
            <p>Стоимость доставки для заказов до 3 тысяч рублей рассчитывается индивидуально.</p>

            <h4>Способы оплаты:</h4>
            <p>Наличный расчёт</p>
            <ul>
              <li>Расплатиться наличными можно лично с курьером, когда он доставит заказ, либо в магазине.</li>
            </ul>
            <p>Безналичный расчет</p>
            <ul>
              <li>У нас доступна безналичная оплата картой, переводом или оплата по QR-коду.</li>
            </ul>
            <p>Кредит</p>
            <ul>
              <li>Оформить данную услугу можно в более чем 10 банках при наличии паспорта гражданина РФ и личном присутствии в магазине.</li>
            </ul>
          </div>
        </v-tab-item>

        <v-tab-item :key="4" value="guarantee">
          <div class="info-tab-container guarantee-content">
            <h4>iPlatinum Store предлагает лучшие гарантийные условия на технику:</h4>

            <ul>
              <li>1 год на всю новую технику;</li>
              <li>30 дней на всю б/у технику.</li>
            </ul>

            <p>Выполняем гарантийные обязательства в течение 45 дней с момента обращения</p>
          </div>
        </v-tab-item>

        <!-- <v-tab-item :key="5" value="services">
          <div class="info-tab-container">
            Сервисы
          </div>
        </v-tab-item> -->
      </v-tabs-items>
    </section>

    <section
      ref="infoMobile"
      class="product-info product-info-mobile"
    >
      <v-expansion-panels
        v-model="panel"
      >
        <v-expansion-panel>
          <v-expansion-panel-header>Описание</v-expansion-panel-header>
          <v-expansion-panel-content>
            <div class="info-tab-container">
              <h4>{{ product.title }}</h4>
              {{ product.description }}
            </div>
          </v-expansion-panel-content>
        </v-expansion-panel>
        <v-expansion-panel>
          <v-expansion-panel-header>Характеристики</v-expansion-panel-header>
          <v-expansion-panel-content>
            <div
              v-if="params"
              class="info-tab-container"
            >
              <h4>{{ product.title }}</h4>

              <section class="params-container">
                <div
                  v-for="param in Object.keys(params)"
                  :key="param"
                  class="item"
                >
                  <h4>{{ param }}</h4>
                  <p v-if="(typeof params[param] === 'string')" v-html="params[param]"></p>
                  <div v-else>
                    <p
                      v-for="nestedParam in Object.keys(params[param])"
                      :key="nestedParam"
                      class="params-row"
                    >
                      <template v-if="params[param][nestedParam] !== 'Нет данных'">
                        <span>{{ nestedParam }}: </span>
                        <span v-html="params[param][nestedParam]"></span>
                      </template>
                    </p>
                  </div>
                </div>
              </section>
            </div>
          </v-expansion-panel-content>
        </v-expansion-panel>
        <v-expansion-panel>
          <v-expansion-panel-header>Доставка и оплата</v-expansion-panel-header>
          <v-expansion-panel-content>
            <div class="info-tab-container delivery-content">
              <p>Бесплатная доставка при заказе от 3 тысяч рублей.</p>
              <p>Стоимость доставки для заказов до 3 тысяч рублей рассчитывается индивидуально.</p>

              <h4>Способы оплаты:</h4>
              <p>Наличный расчёт</p>
              <ul>
                <li>Расплатиться наличными можно лично с курьером, когда он доставит заказ, либо в магазине.</li>
              </ul>
              <p>Безналичный расчет</p>
              <ul>
                <li>У нас доступна безналичная оплата картой, переводом или оплата по QR-коду.</li>
              </ul>
              <p>Кредит</p>
              <ul>
                <li>Оформить данную услугу можно в более чем 10 банках при наличии паспорта гражданина РФ и личном присутствии в магазине.</li>
              </ul>
            </div>
          </v-expansion-panel-content>
        </v-expansion-panel>
        <v-expansion-panel>
          <v-expansion-panel-header>Гарантия</v-expansion-panel-header>
          <v-expansion-panel-content>
            <div class="info-tab-container guarantee-content">
              <h4>iPlatinum Store предлагает лучшие гарантийные условия на технику:</h4>

              <ul>
                <li>1 год на всю новую технику;</li>
                <li>30 дней на всю б/у технику.</li>
              </ul>

              <p>Выполняем гарантийные обязательства в течение 45 дней с момента обращения</p>
            </div>
          </v-expansion-panel-content>
        </v-expansion-panel>
      </v-expansion-panels>
    </section>

    <v-dialog
      v-model="imageDialog"
      width="800"
    >
      <div
        v-if="imageDialogImage.url"
        class="dialog-image"
        :style="`background-image: url(${imageDialogImage.url})`"
      />
    </v-dialog>

    <v-bottom-sheet v-model="bottomSheet">
      <v-sheet
        class="text-center pa-6"
        height="220px"
      >
        <h2 class="py-5 mb-5">
          Заявка успешно отправлена
        </h2>
      </v-sheet>
    </v-bottom-sheet>

    <v-bottom-sheet v-model="bottomForm">
      <v-sheet
        class="text-center pa-6"
      >
        <v-form
          ref="form"
          v-model="valid"
          lazy-validation
          class="product-tradein-form"
        >
          <div class="form">
            <div class="form-row">
              <div class="form-row-label">
                Хочу:
              </div>
              <div class="form-row-content">
                <v-text-field
                  v-model="device"
                  dense
                  hide-details
                  placeholder="Что хотите взять?"
                  outlined
                  :rules="[rules.required]"
                />
              </div>
            </div>

            <div class="form-row">
              <div class="form-row-label">
                Бренд:
              </div>
              <div class="form-row-content">
                <v-text-field
                  v-model="brand"
                  dense
                  hide-details
                  placeholder="Укажите бренд"
                  outlined
                  :rules="[rules.required]"
                />
              </div>
            </div>

            <div class="form-row">
              <div class="form-row-label">
                Модель:
              </div>
              <div class="form-row-content">
                <v-text-field
                  v-model="model"
                  dense
                  hide-details
                  placeholder="Укажите модель"
                  outlined
                  :rules="[rules.required]"
                />
              </div>
            </div>

            <div class="form-row">
              <div class="form-row-label">
                В пользовании:
              </div>
              <div class="form-row-content">
                <v-text-field
                  v-model="inUse"
                  dense
                  hide-details
                  placeholder="5 лет"
                  outlined
                  :rules="[rules.required]"
                />
              </div>
            </div>

            <div class="form-row">
              <div class="form-row-label">
                Имя:
              </div>
              <div class="form-row-content">
                <v-text-field
                  v-model="name"
                  dense
                  hide-details
                  placeholder="Иван"
                  outlined
                  :rules="[rules.required]"
                />
              </div>
            </div>

            <div class="form-row">
              <div class="form-row-label">
                Телефон:
              </div>
              <div class="form-row-content">
                <v-text-field
                  v-model="phone"
                  dense
                  hide-details
                  v-mask="'+7 (###) ###-##-##'"
                  placeholder="Телефон"
                  outlined
                  :rules="[rules.required]"
                />
              </div>
            </div>

            <div class="form-add-desktop">
              <div class="form-row">
                <div class="form-row-label"></div>
                <div class="form-row-content">
                  <v-btn
                    color="primary"
                    class="btn btn-primary"
                    depressed
                    :disabled="!phone"
                    @click="validate"
                  >
                    Оставить заявку на Trade In
                  </v-btn>
                </div>
              </div>

              <div class="form-row">
                <div class="form-row-label"></div>
                <div class="form-row-content">
                  <p class="additional-text">
                    Нажимая кнопку &laquo;Оставить заявку&raquo;, вы&nbsp;соглашаетесь с&nbsp;<NuxtLink to="/privacy-policy">Политикой конфиденциальности</NuxtLink>
                  </p>
                </div>
              </div>
            </div>

            <div class="form-add-mobile">
              <v-btn
                color="primary"
                class="btn btn-primary mb-5"
                depressed
                :disabled="!phone"
                @click="validate"
              >
                Оставить заявку на Trade In
              </v-btn>

              <p class="additional-text">
                Нажимая кнопку &laquo;Оставить заявку&raquo;, вы&nbsp;соглашаетесь с&nbsp;<NuxtLink to="/privacy-policy">Политикой конфиденциальности</NuxtLink>
              </p>
            </div>
          </div>
        </v-form>
      </v-sheet>
    </v-bottom-sheet>

    <Contacts />
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import Label from '@/components/Label.vue';
import Contacts from '@/components/Contacts.vue';
import SliderGoods from '@/components/SliderGoods.vue';
import ServiceCard from '@/components/ServiceCard.vue';
import { Swiper, Navigation, Autoplay } from 'swiper'
import 'swiper/swiper-bundle.min.css'

export default {
  auth: false,
  name: 'ProductPage',
  components: {
    Label,
    Contacts,
    SliderGoods,
    ServiceCard,
  },
  data () {
    return {
      panel: 0,
      bottomSheet: false,
      bottomForm: false,
      images: [],
      imageDialog: false,
      imageDialogImage: {},
      loading: true,
      product: {},
      relatedProducts: [],
      colors: [],
      memoryAmounts: [],
      lengths: [],
      services: [],
      accessories: [],
      colorsList: {
        'темная ночь': '#000033',
        'золотистая охра': '#D4AF37',
        'белый': '#FFFFFF',
        'черный': '#111111',
        'серый': '#808080',
        'серебристый': '#e3e3e3',
        'зеленый': '#00FF00',
        'розовый': '#fbc2df',
        'золотой': '#e9dca0',
        'серый космос': '#808080',
        'сияющая звезда': '#f7eec8',
        'голубой': '#00BFFF',
        'желтый': '#FFFF00',
        'Синий/Медный': '#4169E1',
        'Медный/Никель': '#B87333',
        'фуксия/никель': '#FF00FF',
        'Яркий никель/медь': '#FF7F00',
        'Оранжевый топаз': '#FFA500',
        'розовый/синий': '#FF69B4',
        'черный, фиолетовый': '#8B008B',
        'медный, никель': '#FFB380',
        'фуксия': '#FF00FF',
        'красный': '#e93f3f',
        'синий, розовый': '#FF00FF',
        'никель/медь': '#FFB380',
        'оранжевый топаз': '#FFA500',
        'черный, никель': '#000000',
        'серый, фуксия': '#808080',
        'фуксия, серый': '#FF00FF',
        'серый, красный #808080,': '#FF0000',
        'синий': '#0000FF',
        'черный, медь #000000,': '#B87333',
        'графитовый стальной': '#43464B',
        'серебристый стальной': '#C0C0C0',
        'золото стальной': '#FFD700',
        'Черный/Серый': '#000000',
        'Синий/Серый': '#4B0082',
        'Желтый/бежевый': '#FFD700',
        'Звездный свет': '#FFD700',
        'Оранжевый': '#FFA500',
        'Полночный океан': '#003366',
        'фиолетовый': '#9b6bc3',
        'графитовыйовый': '#4B4B4B',
        'небесно-голубой': '#87CEFA',
        'альпийский зеленый': '#00A693',
        'космический черный': '#414141',
        'темно-фиолетовый': '#7e6591',
        'темно-красный': '#8B0000',
        'мятный': '#00FFB6',
        'персиковый': '#FFDAB9',
        'лайм': '#00FF00',
        'лавандовый': '#E6E6FA',
        'графитовый': '#2F4F4F',
        'оранжевый': '#FFA500',
        'черный фантом': '#000000',
        'бургунди': '#800020',
        'бежевый': '#F5F5DC',
        'серо-зеленый': '#8FBC8F',
        'бронзовый': '#CD7F32',
        'серый графитовый': '#808080',
        'синий океан': '#0000FF',
        'синие звезды': '#0000FF',
        'камуфляж': '#4B5320',
        'голубое небо': '#87CEEB',
        'бирюзовый': '#40E0D0',
        'песочный': '#F4A460',
        'коричневый': '#964B00',
        'черный/золотой': '#000000',
        'кремовый': '#FDF5E6',
        'черный, латунный': '#000000',
        'латунь': '#B87333',
        'серый опал': '#808080',
        'капучино': '#6F4E37',
        'розовое золото': '#FAE0D8',
      },
      tab: 'description',
      brand: '',
      device: '',
      model: '',
      inUse: '',
      name: '',
      phone: '',
      rules: {
        required: value => !!value || 'Обязательное поле',
      },
      valid: true,
    }
  },
  computed: {
    ...mapGetters({
      cartProducts: 'cartProducts',
      favoritesProducts: 'favoritesProducts',
      user: 'user',
      cart: 'cart',
    }),
    relatedProductsToShow() {
      if (this.product?.relatedProducts?.length) {
        return this.product.relatedProducts;
      }

      if (this.accessories?.length) {
        return this.accessories;
      }

      return [];
    },
    isProductInCart () {
      return this.cartProducts.some(p => p.id === this.product.id);
    },
    isProductInFavorites () {
      return this.favoritesProducts.some(p => p === this.product.id);
    },
    characteristics () {
      return JSON.stringify(initialValue);
    },
    bonus () {
      return Math.round(this.product.price * 0.02);
    },
    params () {
      if (this.product?.properties) {
        const itemProps = this.product.properties.replaceAll(`'"`, `&Prime;"`).replaceAll(`''`, `&Prime;"`).replaceAll(`''"`, `&Prime;"`).replaceAll(`"'`, `'`).replaceAll(`'`, `"`);
        
        let itemPropsObj = null;

        try {
          itemPropsObj = JSON.parse(itemProps);
        } catch (error) {
          console.log(error);
        }

        return itemPropsObj;
      }

      return null;      
    },
  },
  async mounted () {
    const productLink = this.$route.params.item;

    await this.getProduct(productLink);
    // await this.getSameParentProducts();
    await this.getAccessories();
    await this.getServices();

    Swiper.use([Navigation, Autoplay]);

    setTimeout(() => {
      new Swiper('.swiper-product', {
        direction: 'horizontal',
        loop: true,
        modules: [Navigation, Autoplay],
        navigation: {
          nextEl: '.slider-product .slider-button-next',
          prevEl: '.slider-product .slider-button-prev',
        },
        autoplay: {
          delay: 150000,
        },
        slidesPerView: 1,
        spaceBetween: 0,
      });
    }, 50);    
  },
  methods: {
    ...mapActions({
      addProductToCart: 'addProductToCart',
      addProductToFavorites: 'addProductToFavorites',
      removeProductFromFavorites: 'removeProductFromFavorites',
    }),
    addToFavorites () {
      if (this.isProductInFavorites) {
        this.removeProductFromFavorites(this.product);
      } else {
        this.addProductToFavorites(this.product);
      }

      if (this.user?.id) {
        // this.handleFavourites();
      }
    },
    addToCart () {
      this.addProductToCart({
        ...this.product,
        amount: 1
      });

      if (this.user?.id) {
        this.handleCart();
      }
    },
    scrollToParams () {
      this.tab = 'params';
      this.panel = 1;

      this.$refs.info.scrollIntoView({ behavior: 'smooth' });
      this.$refs.infoMobile.scrollIntoView({ behavior: 'smooth' });
    },
    async handleCart () {
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

      if (cart) {
        this.updateCart();
      } else {
        this.createCart();
      }
    },
    async createCart () {
      const graphqlQuery = {
        query: `
          mutation {
            createCart (
              data: {
                products: "${JSON.stringify(this.cartProducts).replace(/"/g, '\'')}",
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
    },
    async getSameParentProducts () {
      this.loading = true;

      const graphqlQuery = {
        query: `
          query {
            products (
              where: {
                OR: [
                  { parent: { equals: "${this.product.parent}" } }
                ]
                AND: [
                  { isActive: { equals: true } }
                ]
              }
            ) {
              id
              link
              title
              color
              properties
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });

      if (response?.data?.data?.products) {
        const items = [...response.data.data.products.filter(p => p.id !== this.product.id)];

        for (const item of items) {
          if (!this.colors.find(c => c.color === item.color)) {
            this.colors.push({
              id: item.id,
              link: item.link,
              color: item.color,
            });
          }

          const itemProps = item.properties.replaceAll(`'"`, `&Prime;"`).replaceAll(`''`, `&Prime;"`).replaceAll(`''"`, `&Prime;"`).replaceAll(`"'`, `'`).replaceAll(`'`, `"`);

          let itemPropsObj = {};

          try {
            itemPropsObj = JSON.parse(itemProps);
          } catch (error) {
            console.log(error);
          }

          const memoryUnits = itemPropsObj['Хранение данных'];
      
          if (memoryUnits) {
            const memoryAmount = memoryUnits['Встроенная'];

            if (memoryAmount && !this.memoryAmounts.find(ma => ma.memory === parseInt(memoryAmount))) {
              this.memoryAmounts.push({
                id: item.id,
                link: item.link,
                memoryText: memoryAmount.toUpperCase(),
                memory: parseInt(memoryAmount)
              });
            }
          }

          const lengthUnits = itemPropsObj['Размеры и вес'];
      
          if (lengthUnits) {
            const length = lengthUnits['Длина'];

            if (length && !this.lengths.find(l => l.length === length)) {
              this.lengths.push({
                id: item.id,
                link: item.link,
                length: length,
              });
            }
          }
        }
      }

      this.loading = false;
    },
    async getServices () {
      this.loading = true;

      const graphqlQuery = {
        query: `
          query {
            services {
              id
              code
              title
              caption
              description
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
              category {
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

      if (response?.data?.data?.services) {
        this.services = [...response.data.data.services.filter(p => p.isActive)];
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
        this.accessories = [...response.data.data.products.filter(p => p.isActive && p.id !== this.product.id)];
      }

      this.loading = false;
    },
    openImage (image) {
      if (image?.url) {
        this.imageDialogImage = image;

        this.imageDialog = true;
      }
    },
    async updateCart () {
      const graphqlQuery = {
        query: `
          mutation {
            updateCart (
              where: {
                id: "${this.cart?.id}"
              }
              data: {
                products: "${JSON.stringify(this.cartProducts).replace(/"/g, '\'')}"
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
    async getProduct (link) {
      this.loading = true;

      const graphqlQuery = {
        query: `
          query {
            product(where: { link: "${link}" }) {
              id
              link
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
              relatedProducts {
                id
                link
                title
                caption
                price
                bonus
                isActive
                balance
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

      if (response?.data?.data?.product) {
        this.product = response.data.data.product;
        this.activePhoto = this.product.image?.image?.url;
        this.images.push(this.product.image?.image?.url);
        if (this.product.photo_1) this.images.push(this.product.photo_1);
        if (this.product.photo_2) this.images.push(this.product.photo_2);
        if (this.product.photo_3) this.images.push(this.product.photo_3);
        if (this.product.photo_4) this.images.push(this.product.photo_4);
      }

      const color = {};

      color.colorName = this.product.colorName;
      color.colorCode = this.product.colorCode;
      color.color = this.product.color;
      color.id = this.product.id;
      color.link = this.product.link;
      color.active = true;

      this.device = this.product.title;

      this.colors.push(color);

      if (this.product?.properties) {
        const itemProps = this.product.properties.replaceAll(`'"`, `&Prime;"`).replaceAll(`''`, `&Prime;"`).replaceAll(`''"`, `&Prime;"`).replaceAll(`"'`, `'`).replaceAll(`'`, `"`);

        let itemPropsObj = {};

        try {
          itemPropsObj = JSON.parse(itemProps);
        } catch (error) {
          console.log(error);
        }

        const memoryUnits = itemPropsObj['Хранение данных'];
        
        if (memoryUnits) {
          const memoryAmount = memoryUnits['Встроенная'];

          if (memoryAmount) {
            this.memoryAmounts.push({
              id: this.product.id,
              link: this.product.link,
              active: true,
              memoryText: memoryAmount.toUpperCase(),
              memory: parseInt(memoryAmount)
            });
          }
        }
      }
      
      this.loading = false;
    },
    validate () {
      this.$refs.form.validate();

      if (this.valid) {
        this.sendForm();
      }
    },
    async sendForm() {
      const graphqlQuery = {
        query: `
          mutation {
            createTradeRequest (
              data: {
                brand: "${this.brand}",
                model: "${this.model}",
                name: "${this.name}",
                phone: "${this.phone}",
                used: "${this.inUse}",
                product: {
                  connect: {
                    id: "${this.product?.id}"
                  }
                }
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

      if (response?.data?.data?.createTradeRequest?.id) {
        this.bottomSheet = true;

        this.brand = '';
        this.model = '';
        this.name = '';
        this.phone = '';
        this.inUse = '';
        this.device = '';

        this.$refs.form.resetValidation();

        this.bottomForm = false;

        setTimeout(() => {
          this.bottomSheet = false;
        }, 5000);
      }
    },
  }
}
</script>

<style src="vue2-perfect-scrollbar/dist/vue2-perfect-scrollbar.css"/>

<style>
.slider.slider-product {
  position: relative;
  display: flex;
  justify-content: center;
  width: 500px;
  max-width: 500px;
  min-width: 500px;
}

.slider.slider-product .swiper.swiper-product {
  width: 400px;
  max-width: 400px;
  height: 420px;
  overflow: hidden;
  position: relative;
  padding: 0 8px;
  border: 1px solid #e6e6e6;
  border-radius: 15px;
}

.slider.slider-product .swiper.swiper-product .swiper-slide {
  display: flex;
  justify-content: center;
  align-items: center;
}

.slider.slider-product .swiper.swiper-product .swiper-slide img {
  display: block;
  width: 70%;
  height: 80%;
  object-fit: contain;
  cursor: pointer;
}

.slider.slider-product .slider-button-prev,
.slider.slider-product .slider-button-next {
  position: absolute;
  top: calc(50% - 32px);
  height: 32px;
  width: 32px;
  border-radius: 50%;
  border: 1px solid #e6e6e6;
  cursor: pointer;
  display: flex;
  justify-content: center;
  align-items: center;
}

.slider.slider-product .slider-button-prev {
  left: 0;
  padding-right: 2px;
}

.slider.slider-product .slider-button-next {
  right: 0;
  padding-left: 2px;
}

.v-application .product-container button.btn-fav .icon.active svg {
  color: rgb(228, 59, 59);
}

.v-application .v-tabs {
  min-height: 80px;
  display: flex;
  align-items: center;
  border-bottom: 1px solid #e6e6e6;
}

.v-application .v-tabs-items {
  background: transparent !important;
}

.v-application .v-tabs-bar {
  background-color: transparent !important;
  height: fit-content !important;
}

.v-application .v-tabs-slider-wrapper {
  display: none;
}

.v-application a.v-tab {
  font-family: Evolventa;
  font-size: 18px;
  font-weight: 700;
  line-height: 24px;
  letter-spacing: 0em;
  text-align: left;
  text-transform: none;
  color: #272727 !important;
  height: 34px;
  border-radius: 15px;
  overflow: hidden;
}

.v-application a.v-tab--active {
  background-color: #e6e6e6;
  color: #111111 !important;
}

.v-application .v-expansion-panel {
  background-color: transparent !important;
}

.product-tradein-form {
  width: 500px;
  max-width: 96vw;
  margin: 0 auto;
}

.product-tradein-form .form {
  padding: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 90%;
}

.product-tradein-form .form .form-row {
  display: flex;
  flex-direction: row;
  align-items: center;
  margin-bottom: 20px;
  width: 100%;
}

.product-tradein-form .form .form-row-label {
  min-width: 150px;
  width: 150px;
  max-width: 150px;
}

.product-tradein-form .form .form-row-content {
  flex: 1;
}

.product-tradein-form .form .v-input {
  width: 100%;
  border-radius: 15px;
  border: 1px solid #e6e6e6;
}

.product-tradein-form .form .v-input .v-input__slot {
  padding: 0 24px;
}

.product-tradein-form .form .v-input .v-input__slot fieldset {
  border: none;
}

.product-tradein-form .form .v-input .v-input__slot:before,
.product-tradein-form .form .v-input .v-input__slot:after {
  display: none;
}

.product-tradein-form .form .v-input input {
  max-height: 30px;
  height: 30px;
  border: none;
}

.product-tradein-form .form .additional-text {
  font-size: 11px !important;
  font-weight: 400;
  line-height: 15px !important;
  text-align: center;
}

.product-tradein-form .form .btn {
  margin-top: 10px;
  width: 100%;
  padding: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>

<style scoped>
.product-container {
  display: flex;
  flex-direction: row;
  gap: 50px;
}

.product-header-actions {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  flex-direction: row;
  gap: 30;
  margin-bottom: 30px;
}

.product-header-actions .btn {
  font-size: 10px !important;
  line-height: 12px !important;
}

.product-header-actions .btn .icon {
  margin-right: 7px;
}

.product-title {
  margin-bottom: 10px;
}

.product-title h1 {
  font-size: 28px;
  font-weight: 700;
  line-height: 37px;
  text-align: left;
  margin: 0;
}

.product-bonus {
  margin-bottom: 15px;
}

.product-bonus .bonus {
  display: inline-block;
  border-radius: 5px;
  border: 1px solid #e6e6e6;
  padding: 5px 9px 3px 9px;
  font-size: 14px;
  font-weight: 400;
  line-height: 14px;
}

.product-vendor-code {
  font-size: 10px;
  line-height: 13px;
  margin-bottom: 40px;
}

.product-color-picker {
  display: flex;
  flex-direction: row;
  background-color: #e6e6e6;
  border-radius: 15px;
  padding: 9px 18px;
  gap: 20px;
  width: fit-content;
  color: #111111;
  align-items: center;
  margin-bottom: 30px;
}

.product-color-picker .color {
  background-color: transparent;
  border-radius: 50%;
  height: 19px;
  width: 19px;
  box-shadow: 0 1px 3px 0 rgba(89, 89, 89, 0.7);
  cursor: pointer;
}

.product-color-picker .color.active {
  pointer-events: none;
}

.product-memory-picker {
  display: flex;
  flex-direction: row;
  gap: 20px;
  align-items: center;
  margin-bottom: 30px;
  flex-wrap: wrap;
}

.product-memory-picker .memory {
  border-radius: 15px;
  border: 1px solid #e6e6e6;
  padding: 8px 20px;
}

.product-memory-picker .memory.active {
  background-color: #e6e6e6;
  color: #111111;
}

.product-price {
  font-size: 28px;
  font-weight: 700;
  line-height: 37px;
}

.product-actions {
  margin-bottom: 120px;
  padding-top: 30px;
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 50px;
}

.product-actions .actions-left {
  width: 500px;
  display: flex;
  justify-content: center;
}

.product-actions .actions-right {
  display: flex;
  justify-content: flex-start;
  gap: 30px;
}

.product-actions .in-cart {
  margin-bottom: 0;
  line-height: 26px;
  height: 48px;
  padding: 0 32px;
  display: inline-flex;
  align-items: center;
}

.services-container {
  display: flex;
  flex-direction: row;
  gap: 50px;
  margin-bottom: 120px;
}

.services-container .service-card {
  flex: 1;
}

.product-info {
  margin-bottom: 100px;
  border-radius: 15px;
  border: 1px solid #e6e6e6;
  overflow: hidden;
  padding: 5px 35px 50px 35px;
}

.product-info-mobile {
  display: none;
  border-radius: 0;
  border: 1px solid #e6e6e6;
  border-left: none;
  border-right: none;
  padding: 0;
}

.info-tab-container {
  padding-top: 30px;
  max-height: 500px;
  overflow-y: auto;
}

.info-tab-container h4 {
  margin-bottom: 20px;
}

.info-tab-container h4 {
  margin-bottom: 15px;
}

.info-tab-container div {
  margin-bottom: 40px;
}

.params-container {
  column-count: 2;
  column-gap: 20px 20px;
  width: 100%;
}

.params-container .item {
  margin: 0;
  display: inline-block;
  margin-bottom: 0px;
  width: 100%;
}

.dialog-image {
  height: 600px;
  width: 100%;
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center;
  background-color: #FFFFFF;
}

h2.page-heading {
  margin-bottom: 80px;
  text-align: center;
  width: 100%;
}

.related-products,
.services {
  margin-bottom: 120px;
}

.delivery-content p,
.guarantee-content p {
  margin-bottom: 8px;
}

.delivery-content h4,
.guarantee-content h4 {
  margin-top: 20px;
  margin-bottom: 8px;
}

.delivery-content ul,
.guarantee-content ul {
  margin-bottom: 24px;
}

@media (max-width: 800px) {
  .product-container {
    display: flex;
    flex-direction: column;
    gap: 30px;
  }
  .slider.slider-product {
    position: relative;
    display: flex;
    justify-content: center;
    width: 100%;
    max-width: 100%;
    min-width: 100%;
  }
  .slider.slider-product .swiper.swiper-product {
    width: calc(100% - 90px);
    max-width: calc(100% - 90px);
    height: 400px;
    overflow: hidden;
    position: relative;
    padding: 0;
    border: none;
    border-radius: 0;
  }
  .product-actions {
    margin-bottom: 80px;
    padding-top: 30px;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 30px;
  }

  .product-actions .actions-left {
    width: 100%;
    display: flex;
    justify-content: flex-start;
  }

  .product-actions .actions-right {
    display: flex;
    justify-content: flex-start;
    gap: 30px;
  }

  .services-container {
    display: flex;
    flex-direction: column;
    gap: 30px;
    margin-bottom: 60px;
  }

  .services-container .service-card {
    flex: unset;
  }

  .product-info-mobile {
    display: flex;
  }

  .product-info-desktop {
    display: none;
  }

  .params-container {
    column-count: 1;
  }
}
</style>
