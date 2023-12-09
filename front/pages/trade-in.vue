<template>
  <v-container class="common-page trade-in-page">
    <section class="page-banner">
      <div class="banner-info">
        <h2>Trade-In</h2>
        <p>
          &mdash;&nbsp;услуга, которая позволяет продать магазину старое
          устройство в&nbsp;счёт покупки нового.
        </p>
      </div>
      <div class="banner-more">
        <p>Время услуги: 5-10 минут</p>
      </div>
      <div class="banner-image">
        <img src="../static/images/trade-in.png" alt="trade-in">
      </div>
    </section>

    <section class="trade-in-page-content">
      <h2 class="page-heading">
        Trade-In осуществляется только после полной диагностики устройства по&nbsp;следующим критериям:
      </h2>
      <ul>
        <li>Проверка состояния аккумулятора и&nbsp;сравнение с&nbsp;количеством циклов зарядки.</li>
        <li>Проверка функции True Tone.</li>
        <li>Проверка работоспособности камеры.</li>
        <li>Проверка кнопок переключения громкости и&nbsp;беззвучного режима.</li>
        <li>Проверка зарядки телефона и&nbsp;его потребления.</li>
        <li>Проверка внешнего состояния устройства на&nbsp;сколы и&nbsp;царапины.</li>
        <li>Проверка звуковых динамиков.</li>
        <li>Проверка разговорного микрофона.</li>
        <li>Сверка серийного номера с&nbsp;коробкой.</li>
        <li>Проверка телефона на&nbsp;кражу и&nbsp;блокировку.</li>
      </ul>
      <div class="page-content-more">
        <div>
          <h2>После полной проверки устройства</h2>
          <p>
            мы&nbsp;сообщим вам сумму оценки, чтобы вы&nbsp;могли
            воспользоваться ей&nbsp;в&nbsp;качестве скидки на&nbsp;покупку нового устройства.
          </p>
        </div>
        <NuxtLink
          to="/catalog"
          class="header-nav-link"
        >
          <v-btn
            color="primary"
            class="btn btn-primary"
            depressed
          >
            Перейти в&nbsp;каталог
          </v-btn>
        </NuxtLink>
      </div>
    </section>

    <section class="trade-in-page-form">
      <div>
        <h2>Оцените мое устройство</h2>
        <p>Оставьте заявку и&nbsp;наш менеджер свяжется с&nbsp;вами</p>
        <img src="../static/images/arrow-right.svg" alt="->">
      </div>
      <v-form
        ref="form"
        v-model="valid"
        lazy-validation
      >
        <div class="form">
          <div class="form-row">
            <div class="form-row-label">
              Бренд:
            </div>
            <div class="form-row-content">
              <v-text-field
                v-model="brand"
                dense
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
    </section>

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

    <Contacts />
  </v-container>
</template>

<script>
import { mapActions } from 'vuex';
import Contacts from '@/components/Contacts.vue';

export default {
  name: 'TradeInPage',
  components: {
    Contacts,
  },
  data () {
    return {
      loading: false,
      brand: '',
      model: '',
      inUse: '',
      name: '',
      phone: '',
      rules: {
        required: value => !!value || 'Обязательное поле',
      },
      valid: true,
      bottomSheet: false,
    }
  },
  methods: {
    ...mapActions({
      setAuth: 'login',
    }),
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

        this.$refs.form.resetValidation();

        setTimeout(() => {
          this.bottomSheet = false;
        }, 5000);
      }
    },
  },
};
</script>

<style>
.trade-in-page .page-banner .banner-info {
  margin-top: 63px;
}

.trade-in-page .page-banner .banner-info h2 {
  margin-bottom: 30px;
}

.trade-in-page .page-banner .banner-more {
  width: fit-content;
  height: fit-content;
}

.trade-in-page .page-banner .banner-image {
  align-items: center;
  padding: 15px 0;
}

.trade-in-page .trade-in-page-content {
  max-width: 850px;
  margin: 0 auto;
  font-size: 18px;
  margin-bottom: 120px;
}

.trade-in-page .trade-in-page-content h2 {
  font-size: 28px;
  font-weight: 700;
  line-height: 37px;
  text-align: left;
  margin-bottom: 37px;
}

.trade-in-page .trade-in-page-content ul {
  margin: 0;
  margin-bottom: 80px;
  list-style: none;
  max-width: 70%;
}

.trade-in-page .trade-in-page-content ul li {
  margin-bottom: 20px;
  position: relative;
  padding-left: 45px;
}

.trade-in-page .trade-in-page-content ul li:before {
  content: '';
  display: inline-block;
  height: 25px;
  width: 47px;
  position: absolute;
  background-image: url(../static/images/switch.png);
  background-size: contain;
  background-repeat: no-repeat;
  left: -20px;
  top: calc(50% - 15px);
}

.trade-in-page .trade-in-page-content .page-content-more {
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 30px;
}

.trade-in-page .trade-in-page-content .page-content-more h2 {
  margin-bottom: 15px;
}

.trade-in-page .trade-in-page-content .page-content-more p {
  font-size: 18px;
  font-weight: 400;
  line-height: 24px;
  text-align: left;
}

.trade-in-page .trade-in-page-form {
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 50px;
  margin-bottom: 120px;
  border: 1px solid #e6e6e6;
  border-radius: 30px;
  padding: 50px 70px;
}
.trade-in-page .trade-in-page-form div:first-of-type h2 {
  margin-bottom: 20px;
}

.trade-in-page .trade-in-page-form div:first-of-type p {
  font-size: 28px;
  font-weight: 400;
  line-height: 37px;
}

.trade-in-page .form {
  padding: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 90%;
}

.trade-in-page .form .form-row {
  display: flex;
  flex-direction: row;
  align-items: center;
  margin-bottom: 20px;
  width: 100%;
}

.trade-in-page .form .form-row-label {
  min-width: 150px;
  width: 150px;
  max-width: 150px;
}

.trade-in-page .form .form-row-content {
  flex: 1;
}

.trade-in-page .form .v-input {
  width: 100%;
  border-radius: 15px;
  border: 1px solid #e6e6e6;
}

.trade-in-page .form .v-input .v-input__slot {
  padding: 0 24px;
}

.trade-in-page .form .v-input .v-input__slot fieldset {
  border: none;
}

.trade-in-page .form .v-input .v-input__slot:before,
.trade-in-page .form .v-input .v-input__slot:after {
  display: none;
}

.trade-in-page .form .v-input input {
  max-height: 50px;
  height: 50px;
  border: none;
}

.trade-in-page .form .additional-text {
  font-size: 11px !important;
  font-weight: 400;
  line-height: 15px !important;
  text-align: center;
}

.trade-in-page .form .btn {
  margin-top: 10px;
  width: 100%;
  padding: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}

.form-add-mobile {
  display: none;
}

@media (max-width: 800px) {
  .trade-in-page .trade-in-page-content .page-content-more {
    display: flex;
    flex-direction: column;
    align-items: center;
    grid-gap: 30px;
    gap: 30px;
  }

  .trade-in-page .trade-in-page-form {
    display: flex;
    flex-direction: column;
    align-items: center;
    grid-gap: 50px;
    gap: 50px;
    margin-bottom: 120px;
    border: 1px solid #e6e6e6;
    border-radius: 30px;
    padding: 50px 16px;
  }

  .trade-in-page .form {
    padding: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
  }

  .trade-in-page .form .form-row-label {
    min-width: 130px;
    width: 130px;
    max-width: 130px;
  }

  .form-add-mobile {
    display: block;
  }

  .form-add-desktop {
    display: none;
  }
}
</style>

