<template>
  <v-container class="common-page credit-page">
    <section class="page-banner">
      <div class="banner-info">
        <h2>
          iPlatinum Store предоставляет
          <br>
          кредит на&nbsp;выгодных условиях
        </h2>
        <p>
          Оформить вашу покупку в&nbsp;кредит вы&nbsp;можете при личном
          <br>
          присутствии в&nbsp;магазине с&nbsp;паспортом гражданина&nbsp;РФ.
        </p>
        <p>
          Оформление доступно более чем от&nbsp;10&nbsp;банков.
        </p>
      </div>
      <div class="banner-more">
        <p>
          Срок от&nbsp;3&nbsp;до&nbsp;36&nbsp;мес
          <br>
          Заполнение заявки в&nbsp;течение 10&nbsp;минут
        </p>
      </div>
      <div class="banner-image">
        <img src="../static/images/credit.png" alt="Credit">
      </div>
    </section>

    <section class="credit-page-content">
      <div>
        <h2>Остались вопросы?</h2>
        <p>Оставьте ваши контакты, мы&nbsp;свяжемся с&nbsp;вами в&nbsp;ближайшее время</p>
        <img src="../static/images/arrow-right.svg" alt="->">
      </div>
      <v-form
        ref="form"
        v-model="valid"
        lazy-validation
      >
        <div class="form">
          <v-text-field
            v-model="name"
            dense
            placeholder="Имя"
            outlined
            :rules="[rules.required]"
          />
          <v-text-field
            v-model="phone"
            dense
            v-mask="'+7 (###) ###-##-##'"
            placeholder="Телефон"
            outlined
            :rules="[rules.required]"
          />
          <v-btn
            color="primary"
            class="btn btn-primary"
            depressed
            :disabled="!phone"
            @click="validate"
          >
            Задать вопрос
          </v-btn>
          <p class="additional-text">
            Нажимая кнопку &laquo;Задать вопрос&raquo;, вы&nbsp;соглашаетесь с&nbsp;<NuxtLink to="/privacy-policy">Политикой конфиденциальности</NuxtLink>
          </p>
        </div>
      </v-form>
    </section>

    <v-bottom-sheet v-model="bottomSheet">
      <v-sheet
        class="text-center pa-6"
        height="220px"
      >
        <h2 class="py-5 mb-5">
          Спасибо, мы&nbsp;свяжемся с&nbsp;вами в&nbsp;ближайшее время
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
  name: 'CreditPage',
  components: {
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
            createQuestion (
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

      if (response?.data?.data?.createQuestion?.id) {
        this.bottomSheet = true;

        this.name = '';
        this.phone = '';

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
.credit-page .page-banner .banner-info {
  margin-top: 63px;
}

.credit-page .page-banner .banner-info h2 {
  margin-bottom: 30px;
}

.credit-page .page-banner .banner-image {
  align-items: flex-end;
}

.credit-page .credit-page-content {
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 35px;
  margin-bottom: 120px;
}

.credit-page .credit-page-content h2 {
  font-size: 28px;
  font-weight: 700;
  line-height: 37px;
  text-align: left;
  margin-bottom: 37px;
}

.credit-page .credit-page-content p {
  font-size: 28px;
  font-weight: 400;
  line-height: 37px;
  text-align: left;
}

.credit-page .credit-page-content p:last-of-type {
  margin-bottom: 60px;
}

.credit-page .credit-page-content .form {
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

.credit-page .credit-page-content .form .v-input {
  width: 100%;
  border-radius: 20px;
  border: 2px solid #e6e6e6;
  margin-bottom: 30px;
}

.credit-page .credit-page-content .form .v-input .v-input__slot {
  padding: 0 30px;
}

.credit-page .credit-page-content .form .v-input .v-input__slot fieldset {
  border: none;
}

.credit-page .credit-page-content .form .v-input .v-input__slot:before,
.credit-page .credit-page-content .form .v-input .v-input__slot:after {
  display: none;
}

.credit-page .credit-page-content .form .v-input input {
  max-height: 50px;
  height: 50px;
  border: none;
}

.credit-page .credit-page-content .form .additional-text {
  font-size: 11px;
  font-weight: 400;
  line-height: 15px;
  text-align: center;
}

.credit-page .credit-page-content .form .btn {
  margin-bottom: 25px;
}

@media (max-width: 800px) {
  .credit-page .credit-page-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    grid-gap: 35px;
    gap: 35px;
    margin-bottom: 60px;
  }

  .credit-page .credit-page-content .form {
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
