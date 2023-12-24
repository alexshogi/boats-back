<template>
  <v-container class="common-page reviews-page">
    <Gear />
    <!-- <h1>Что о&nbsp;нас говорят клиенты</h1>

    <section class="reviews-page-reviews">
      <article class="review">
        <header>
          <span class="name">Алексей Плотников</span>
          <img src="../static/images/logo_google.png" height="28" alt="google">
        </header>
        <main>
          Хочется сказать ребятам спасибо большое! Очень быстро, качественно и&nbsp;совсем не&nbsp;ломят
          цену за&nbsp;ремонт. Буду если что только у&nbsp;них. На&nbsp;самом деле молодцы. Спасибо.
        </main>
        <footer>
          <a
            href="https://www.google.com/maps/place/Iplatinum+Store/@54.702477,20.5168809,15z/data=!4m8!3m7!1s0x46e31614e519936b:0xb2c657f00eee5f31!8m2!3d54.702477!4d20.5168809!9m1!1b1!16s%2Fg%2F11j1hy58sz"
            target="_blank"
          >
            Читать отзывы в&nbsp;Гугл Картах
          </a>
        </footer>
      </article>

      <article class="review">
        <header>
          <span class="name">Максим Пашков</span>
          <img src="../static/images/logo_yamap.png" height="28" alt="google">
        </header>
        <main>
          Прекрасный сервис. Постоянно обращаюсь именно к&nbsp;ним, ребята делают очень
          качественно, быстро и&nbsp;по&nbsp;приятной цене, в&nbsp;подарок почистили всё
          устройство: камеру от&nbsp;пыли, сеточки и&nbsp;порт от&nbsp;грязи.
        </main>
        <footer>
          <a
            href="https://yandex.ru/maps/org/iplatinum/4661400667/reviews/?ll=20.517459%2C54.702126&z=16"
            target="_blank"
          >
            Читать отзывы в&nbsp;Яндекс Картах
          </a>
        </footer>
      </article>

      <article class="review">
        <header>
          <span class="name">Алекс К</span>
          <img src="../static/images/logo_2gis.png" height="28" alt="2gis">
        </header>
        <main>
          Отличный сервис. Вежливый и&nbsp;отзывчивый персонал. Приятные цены. Рекомендую!
        </main>
        <footer>
          <a
            href="https://2gis.ru/kaliningrad/firm/70000001038069514/tab/reviews"
            target="_blank"
          >
            Читать отзывы в&nbsp;2gis
          </a>
        </footer>
      </article>
    </section>

    <section class="reviews-page-content">
      <div>
        <h2>Оставьте отзыв о&nbsp;ваших покупках и&nbsp;получите подарок!</h2>
        <img src="../static/images/arrow-right.svg" alt="->">
      </div>
      <div class="form">
        <v-text-field
          v-model="name"
          dense
          placeholder="Имя"
          outlined
          hide-details
          :rules="[rules.required]"
        />
        <v-text-field
          v-model="phone"
          dense
          v-mask="'+7 (###) ###-##-##'"
          placeholder="Телефон"
          outlined
          hide-details
          :rules="[rules.required]"
        />
        <v-textarea
          v-model="review"
          dense
          placeholder="Отзыв"
          auto-grow
          outlined
          rows="1"
          hide-details
          :rules="[rules.required]"
        />
        <v-btn
          color="primary"
          class="btn btn-primary"
          depressed
        >
          Оставить отзыв
        </v-btn>
        <p class="additional-text">
          Нажимая кнопку &laquo;Оставить отзыв&raquo;, вы&nbsp;соглашаетесь с&nbsp;<NuxtLink to="/privacy-policy">Политикой конфиденциальности</NuxtLink>
        </p>
      </div>
    </section>

    <Contacts /> -->
  </v-container>
</template>

<script>
import { mapActions } from 'vuex';
import Contacts from '@/components/Contacts.vue';
import Gear from '@/components/Gear.vue';

export default {
  name: 'ReviewsPage',
  components: {
    Contacts,
    Gear,
  },
  data () {
    return {
      loading: false,
      name: '',
      phone: '',
      review: '',
      rules: {
        required: value => !!value || 'Обязательное поле',
      },
      valid: true,
    }
  },
  methods: {
    ...mapActions({
      setAuth: 'login',
    }),
    validate () {
      this.$refs.form.validate();

      if (this.valid) {
        this.login();
      }
    },
  },
};
</script>

<style>
.reviews-page h1 {
  font-size: 28px;
  font-weight: 700;
  line-height: 37px;
  text-align: center;
  margin-bottom: 50px;
}

.reviews-page .reviews-page-reviews {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 30px;
  margin-bottom: 120px;
}

.reviews-page .reviews-page-reviews .review {
  border: 1px solid #f6f6f6;
  border-radius: 15px;
  padding: 36px 24px;
  font-size: 18px;
  font-weight: 400;
  line-height: 24px;
  text-align: left;
}

.reviews-page .reviews-page-reviews .review header {
  margin-bottom: 30px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.reviews-page .reviews-page-reviews .review main {
  margin-bottom: 30px;
}

.reviews-page .reviews-page-content {
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 35px;
  margin-bottom: 120px;
}

.reviews-page .reviews-page-content h2 {
  font-size: 28px;
  font-weight: 700;
  line-height: 37px;
  text-align: left;
  margin-bottom: 37px;
}

.reviews-page .reviews-page-content p {
  font-size: 28px;
  font-weight: 400;
  line-height: 37px;
  text-align: left;
}

.reviews-page .reviews-page-content p:last-of-type {
  margin-bottom: 60px;
}

.reviews-page .reviews-page-content .form {
  min-width: 550px;
  width: 550px;
  max-width: 550px;
  border: 2px solid #e6e6e6;
  border-radius: 20px;
  padding: 52px 95px 29px 95px;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.reviews-page .reviews-page-content .form .v-input {
  width: 100%;
  border-radius: 20px;
  border: 2px solid #e6e6e6;
  margin-bottom: 30px;
}

.reviews-page .reviews-page-content .form .v-input .v-input__slot {
  padding: 0 30px;
}

.reviews-page .reviews-page-content .form .v-input .v-input__slot fieldset {
  border: none;
}

.reviews-page .reviews-page-content .form .v-input .v-input__slot:before,
.reviews-page .reviews-page-content .form .v-input .v-input__slot:after {
  display: none;
}

.reviews-page .reviews-page-content .form .v-input input {
  max-height: 50px;
  height: 50px;
  border: none;
}

.reviews-page .reviews-page-content .form .additional-text {
  font-size: 11px;
  font-weight: 400;
  line-height: 15px;
  text-align: center;
}

.reviews-page .reviews-page-content .form .btn {
  margin-bottom: 25px;
}

@media (max-width: 800px) {
  .reviews-page .reviews-page-reviews {
    display: grid;
    grid-template-columns: repeat(1, 1fr);
    gap: 30px;
    margin-bottom: 60px;
  }

  .reviews-page .reviews-page-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    grid-gap: 35px;
    gap: 35px;
    margin-bottom: 60px;
  }

  .reviews-page .reviews-page-content .form {
    min-width: 100%;
    width: 100%;
    max-width: 100%;
    border: 2px solid #e6e6e6;
    border-radius: 12px;
    padding: 32px;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
}
</style>
