<template>
  <v-container
    ref="page"
    class="index-page"
  >
    <!-- <section class="hero">
      <SliderMain />
    </section> -->

    <section class="special">
      <h2>Специальные предложения</h2>
      <SliderGoods
        v-if="specialGoods?.length"
        :products="specialGoods"
      />
    </section>

    <section class="block block-blue d-flex">
      <div class="left">
        <div>
          <h2>«ТАКТИКА» —</h2>
          <p>
            лодки, созданные с заботой о своих покупателях.
            <br>
            «Тактика» — это качество и сервис по доступной цене.
          </p>
        </div>
        <ol class="custom-list">
          <li>
            <span class="number">11</span>
            <p>
              лет на рынке
              <br>
              судостроения
            </p>
          </li>
        </ol>
        <div>
          <h2>Миссия «Тактики» —</h2>
          <p>
            возродить судостроительный завод города Сосновка и вернуть почетное
            звание «Город судостроителей» с градообразующим предприятием с 1000 сотрудников.
          </p>
          <p style="margin-bottom: 30px;">
            Это поможет развивать сферы культуры и образования города, обеспечивая его новыми
            рабочими местами и возможностями для взрослых и детей.
          </p>
          <NuxtLink to="" style="font-size: 13px;">Читать больше о развитии города</NuxtLink>
        </div>
      </div>
      <div class="right">
        <div style="padding-left: 150px;">
          <p class="font-weight-bold">
            Балабанов Александр
            <br>
            Владимирович
          </p>
          <p class="font-italic text-subtitle-1 font-weight-light" style="font-size: 15px;">
            Генеральный директор
            <br>
            ООО «Тимакс»
          </p>
        </div>
        <div>
          <span class="font-italic text-subtitle-1 font-weight-light" style="font-size: 15px;">Обладатель благодарности</span>
          <p class="font-weight-bold my-0">«Производственный бизнес 2023»</p>
          <span class="font-italic text-subtitle-1 font-weight-light" style="font-size: 15px;">по версии Главы Вятскополянского района</span>
        </div>
      </div>
    </section>

    <section class="popular">
      <h2>Популярные товары</h2>
      <SliderGoods
        v-if="popularGoods?.length"
        :products="popularGoods"
      />
    </section>

    <section class="categories">
      <article class="category">
        <div class="category-image">
          <img src="/images/categories/motors.png" height="228" alt="Моторы">
        </div>
        <div>
          <div class="category-title">Моторы для лодок</div>
          <div class="category-caption">Сделайте вашу лодку еще быстрее</div>
          <NuxtLink
            to="/catalog"
            class="text-decoration-none"
          >
            <v-btn
              class="btn medium btn-secondary"
              depressed
            >
              Подробнее
            </v-btn>
          </NuxtLink>
        </div>
      </article>
      <article class="category">
        <div class="category-image">
          <img src="/images/categories/trailers.png" height="228" alt="Прицепы">
        </div>
        <div>
          <div class="category-title">Прицепы</div>
          <div class="category-caption">Транспортируйте судно c комфортом</div>
          <NuxtLink
            to="/catalog"
            class="text-decoration-none"
          >
            <v-btn
              class="btn medium btn-secondary"
              depressed
            >
              Подробнее
            </v-btn>
          </NuxtLink>
        </div>
      </article>
      <article class="category">
        <div class="category-image">
          <img src="/images/categories/accessories.png" height="210" alt="Аксессуары">
        </div>
        <div>
          <div class="category-title">Дополнительные аксессуары</div>
          <div class="category-caption">Тенты, жилеты и другое</div>
          <NuxtLink
            to="/catalog"
            class="text-decoration-none"
          >
            <v-btn
              class="btn medium btn-secondary"
              depressed
            >
              Подробнее
            </v-btn>
          </NuxtLink>
        </div>
      </article>
      <article class="category category-dark">
        <div class="category-image align-right">
          <img src="/images/categories/boats.png" height="252" alt="Лодки">
        </div>
        <div>
          <div class="category-title">Каталог лодок и катеров</div>
          <div class="category-caption">Моторные, весельные, каютные</div>
          <NuxtLink
            to="/catalog"
            class="text-decoration-none"
          >
            <v-btn
              color="primary"
              class="btn medium btn-primary"
              depressed
            >
              Подробнее
            </v-btn>
          </NuxtLink>
        </div>
      </article>
    </section>

    <section class="block block-blue block-request">
      <div>
        <h2>
          Ваш заказ будет вести
          <br>
          персональный менеджер
        </h2>
        <p>
          Это поможет вам получить быстрые ответы на вопросы,
          <br>
          оформить заказ или внести в него изменения
        </p>
      </div>
      <div class="form">
        <v-form
          ref="form"
          v-model="valid"
          lazy-validation
        >
          <div class="form-row">
            <div class="form-row-content">
              <v-text-field
                v-model="phone"
                dense
                v-mask="'+7 (###) ###-##-##'"
                placeholder="+7 (999) 999-00-00"
                outlined
                hide-details
                :rules="[rules.required]"
              />
            </div>
          </div>

          <div class="form-row">
            <div class="form-row-content">
              <v-text-field
                v-model="name"
                dense
                placeholder="Ваше имя"
                outlined
                hide-details
                :rules="[rules.required]"
              />
            </div>
          </div>

          <div class="form-add-desktop">
            <div class="form-row">
              <div class="form-row-content">
                <v-btn
                  color="primary"
                  class="btn btn-primary"
                  depressed
                  :disabled="!phone || !name"
                  @click="validate"
                >
                  Отправить
                </v-btn>
              </div>
            </div>

            <div class="form-row">
              <div class="form-row-content">
                <p class="additional-text">
                  Нажимая кнопку, вы&nbsp;соглашаетесь
                  <br>
                  с&nbsp;
                  <NuxtLink to="/privacy-policy">Политикой конфиденциальности</NuxtLink>
                </p>
              </div>
            </div>
          </div>
        </v-form>
      </div>
    </section>

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
import Contacts from '@/components/Contacts.vue';

export default {
  auth: false,
  name: 'IndexPage',
  components: {
    SliderMain,
    SliderGoods,
    Contacts,
  },
  data () {
    return {
      loading: false,
      name: '',
      phone: '',
      rules: {
        required: value => !!value || 'Обязательное поле',
      },
      valid: true,
      popularGoods: [],
      specialGoods: [],
      categories: [],
    }
  },
  async mounted () {
    await this.getCats();
    await this.getPopularGoods();
    await this.getSpecialGoods();
  },
  methods: {
    openGoodsItem (item) {
      this.$router.push({ path: `catalog/${item}` });
    },
    async getPopularGoods () {
      this.loading = true;

      const graphqlQuery = {
        query: `
          query {
            products(
              take: 9,
              where: {
                category: { some: { code: { equals: "popular" } } }
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
              images {
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
        this.popularGoods = [...response.data.data.products];
      }

      this.loading = false;
    },
    async getSpecialGoods () {
      this.loading = true;

      const graphqlQuery = {
        query: `
          query {
            products(
              take: 9,
              where: {
                category: { some: { code: { equals: "special" } } }
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
              images {
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
        this.specialGoods = [...response.data.data.products];
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
                name: "${this.name}",
                phone: "${this.phone}",
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

        this.name = '';
        this.phone = '';

        this.$refs.form.resetValidation();

        setTimeout(() => {
          this.bottomSheet = false;
        }, 5000);
      }
    },
  }
}
</script>

<style lang="scss" scoped>
.index-page {
  padding: 0;
  padding-top: 90px;
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

.special,
.popular {
  text-align: center;
  margin-bottom: 110px;

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

.block .left {
  flex: 3;
  padding-right: 100px;
}

.block .right {
  flex: 2;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.block-request {
  display: flex;
  gap: 120px;
  justify-content: space-between;
  align-items: center;
  padding: 60px 90px;
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
