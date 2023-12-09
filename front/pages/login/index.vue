<template>
  <section
    class="auth-page"
  >
    <v-card class="pa-8">
      <v-row>
        <v-col>
          <h2>Вход</h2>
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
              label="email"
              outlined
              :rules="emailRules"
            />
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="12" class="py-0">
            <v-text-field
              v-model="password"
              dense
              label="пароль"
              outlined
              :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
              :rules="[rules.required, rules.min]"
              :type="showPassword ? 'text' : 'password'"
              @click:append="showPassword = !showPassword"
            />
          </v-col>
        </v-row>
      </v-form>

      <v-row>
        <v-col cols="3" class="text-left">
          <!-- <NuxtLink
            to="auth/restore"
            style="text-decoration: none; font-size: 14px;"
          >
            Забыли пароль?
          </NuxtLink> -->
        </v-col>

        <v-col cols="9" class="text-right">
          <NuxtLink
            to="/register"
            style="text-decoration: none; font-size: 14px;"
          >
            Зарегистрироваться
          </NuxtLink>
        </v-col>
      </v-row>

      <v-row class="mt-8">
        <v-col class="d-flex justify-center">
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
            <span v-else>Войти</span>
          </v-btn>
        </v-col>
      </v-row>
    </v-card>
  </section>
</template>

<script>
import { mapActions } from 'vuex';

export default {
  name: 'AuthPage',
  data () {
    return {
      loading: false,
      email: '',
      password: '',
      errorMessage: '',
      showPassword: false,
      rules: {
        required: value => !!value || 'Обязательное поле',
        min: v => v.length >= 8 || 'Минимум 8 символов',
      },
      emailRules: [
        v => !!v || 'Обязательное поле',
        v => /.+@.+\..+/.test(v) || 'Электронная почта должна быть действующей',
      ],
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
    reset () {
      this.$refs.form.reset();
    },
    resetValidation () {
      this.$refs.form.resetValidation();
    },
    async login () {
      this.loading = true;

      const graphqlQuery = {
        query: `
          mutation {
            authenticateUserWithPassword(
              email: "${this.email}"
              password: "${this.password}"
            ) {
              __typename
              ... on UserAuthenticationWithPasswordSuccess {
                sessionToken
                item {
                  id
                  name
                  email
                }
              }
              ... on UserAuthenticationWithPasswordFailure {
                message
              }
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery),
      });

      const result = response.data;

      this.loading = false;

      if (result?.data?.authenticateUserWithPassword?.message) {
        this.errorMessage = result.data.authenticateUserWithPassword.message;
        console.log('error', this.errorMessage);
      }

      if (result?.data?.authenticateUserWithPassword?.item && result?.data?.authenticateUserWithPassword?.sessionToken) {
        const user = result.data.authenticateUserWithPassword.item;
        const sessionToken = result.data.authenticateUserWithPassword.sessionToken;

        this.setAuth({
          user: user,
          sessionToken: sessionToken,
        });

        this.$router.push({ path: '/' });
      };
    },
  },
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

  .auth-page {
    width: 500px;
    max-width: 100%;
    min-height: 400px;
    margin-top: 40px;
    margin-left: auto;
    margin-right: auto;
    padding: 0 20px;
  }
</style>
