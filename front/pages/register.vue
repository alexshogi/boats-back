<template>
  <section
    class="register-page"
  >
    <v-card class="pa-8">
      <v-row>
        <v-col>
          <h2>Регистрация</h2>
        </v-col>
      </v-row>

      <v-row>
        <v-col cols="12">
          <div class="divider" />
        </v-col>
      </v-row>

      <v-row class="pb-3">
        <v-col cols="12" class="red--text text-center">
          {{ errorMessage }}
        </v-col>
      </v-row>

      <v-form
        ref="form"
        v-model="valid"
        lazy-validation
      >
        <v-row>
          <v-col cols="12" class="py-0">
            <v-text-field
              v-model="email"
              dense
              label="E-mail"
              hint="Является логином для входа в личный кабинет"
              persistent-hint
              outlined
              :rules="emailRules"
            />
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="12" class="py-0">
            <v-text-field
              v-model="name"
              dense
              label="Имя"
              outlined
              :rules="[rules.required]"
            />
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="12" xs="12" class="py-0">
            <v-text-field
              v-model="password"
              dense
              hint="Пароль должен содержать минимум 8 символов"
              label="Задайте пароль"
              outlined
              persistent-hint
              :rules="passwordRules"
            />
          </v-col>
          <v-col cols="12" xs="12" class="py-0">
            <v-text-field
              v-model="passwordConfirm"
              dense
              label="Подтвердите пароль"
              outlined
              :rules="passwordConfirmRules"
            />
          </v-col>
        </v-row>
      </v-form>

      <v-row>
        <v-col cols="6" class="text-left"></v-col>

        <v-col cols="6" class="text-right">
          <NuxtLink
            to="/login"
            style="text-decoration: none; font-size: 14px;"
          >
            Войти
          </NuxtLink>
        </v-col>
      </v-row>

      <v-row>
        <v-col cols="12" class="d-flex justify-center">
          <v-btn
            color="primary"
            class="btn btn-primary"
            depressed
            @click="validate"
          >
            <v-progress-circular
              v-if="loading"
              indeterminate
              size="20"
              width="2"
              color="white"
            />
            <span v-else>Зарегистрироваться</span>
          </v-btn>
        </v-col>
      </v-row>
    </v-card>

    <v-snackbar
      v-model="snackbar"
      :timeout="4000"
    >
      Успешная регистрация. Переход на страницу входа...
    </v-snackbar>
  </section>
</template>

<script>
export default {
  name: 'RegisterPage',
  data () {
    return {
      loading: false,
      snackbar: false,
      email: '',
      phone: '',
      name: '',
      password: '',
      passwordConfirm: '',
      rules: {
        required: value => !!value || 'Обязательное поле',
      },
      emailRules: [
        v => !!v || 'Обязательное поле',
        v => /.+@.+\..+/.test(v) || 'Электронная почта должна быть действующей',
      ],
      passwordRules: [
        value => !!value || 'Обязательное поле',
        value => (value && value.length >= 8 ) || 'Минимум 8 символов',
      ],
      passwordConfirmRules: [
        v => !!v || 'Обязательное поле',
        v => v === this.password || 'Пароли должны совпадать',
      ],
      errorMessage: '',
      valid: true,
    }
  },
  methods: {
    validate () {
      this.$refs.form.validate();

      if (this.valid) {
        this.register();
      }
    },
    reset () {
      this.$refs.form.reset();
    },
    resetValidation () {
      this.$refs.form.resetValidation();
    },
    async register () {
      this.loading = true;

      const graphqlQuery = {
        query: `
          mutation {
            createUser(data: {
              name: "${this.name}",
              email: "${this.email}",
              password: "${this.password}"
            }) {
              email
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });

      const result = response.data;

      this.loading = false;

      const email = result.data?.createUser?.email;

      if (email) {
        this.snackbar = true;

        setTimeout(() => {
          this.snackbar = false;
          this.$router.push({ path: '/login' });
        }, 4000);
      }
    },
  }
}
</script>

<style>
  .v-text-field__details {
    padding: 0 !important;
  }
</style>

<style lang="scss" scoped>
  .divider {
    height: 1px;
    width: 100%;
    background-color: #e6e6e6;
  }

  .register-page {
    width: 960px;
    min-height: 400px;
    margin-top: 40px;
    margin-left: auto;
    margin-right: auto;
    padding: 0 96px;
  }

  @media (max-width: 800px) {
    .register-page {
      width: 100%;
      min-height: 400px;
      margin-top: 15px;
      margin-left: auto;
      margin-right: auto;
      padding: 16px;
    }
  }
</style>
