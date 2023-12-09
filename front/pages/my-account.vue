<template>
  <v-container class="common-page user-page">
    <h2>Личный кабинет</h2>

    <section v-if="user?.id">
      <p>{{ user.name }}</p>
      <p>{{ user.email }}</p>
      <p>{{ user.phone }}</p>
    </section>

    <section v-else>
      <NuxtLink
        to="/login"
        style="text-decoration: none; font-size: 14px;"
      >
        <v-btn
          class="btn btn-outline"
          depressed
        >
          Войти
        </v-btn>
      </NuxtLink>
    </section>
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';

export default {
  name: 'UserPage',
  data () {
    return {

    }
  },
  computed: {
    ...mapGetters({
      user: 'user',
    }),
  },
}
</script>

<style scoped>
.user-page h2 {
  margin-bottom: 70px;
}
</style>