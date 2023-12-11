<template>
  <v-container class="common-page guarantee-page">
    <section class="page-banner">
      <div class="banner-info">
        <h2>iPlatinum Store предлагает лучшие гарантийные условия на&nbsp;технику:</h2>
        <ul>
          <li>
            <b>1&nbsp;год</b> на&nbsp;всю новую технику;
          </li>
          <li>
            <b>30&nbsp;дней</b> на&nbsp;всю б/у технику.
          </li>
        </ul>
      </div>
      <div class="banner-more">
        <p>Выполняем гарантийные обязательства в&nbsp;течение 45&nbsp;дней с&nbsp;момента обращения</p>
      </div>
      <div class="banner-image">
        <!-- <img src="../static/images/guarantee.png" alt="Guarantee"> -->
      </div>
    </section>

    <section class="page-info-block">
      <span>
        Купите гарантию на&nbsp;ваше устройство
        <br>
        отдельно&nbsp;&mdash; будьте уверены в&nbsp;защите!
      </span>
    </section>

    <section class="guarantee-page-content">
      <h2 class="page-heading">
        Если вы&nbsp;хотите продлить срок гарантийного обслуживания вашего устройства
        после его окончания, то&nbsp;у&nbsp;нас доступна отдельная гарантия:
      </h2>
      <ul>
        <li>
          <b>на&nbsp;новые устройства&nbsp;&mdash; 10%</b> от&nbsp;стоимости
          устройства на&nbsp;дополнительные 6&nbsp;месяцев/ 15% от&nbsp;стоимости
          устройства на&nbsp;дополнительные 12&nbsp;месяцев
        </li>
        <li>
          <b>на&nbsp;б/у&nbsp;&mdash; 15%</b> от&nbsp;стоимости
          устройства на&nbsp;дополнительные 6&nbsp;месяцев&nbsp;/ 20% от&nbsp;стоимости
          устройства на&nbsp;дополнительные 12&nbsp;месецев.
        </li>
      </ul>
      <p>
        <b>
          У&nbsp;нас есть собственный сервисный центр
          <a href="https://service.iplatinum.ru/" class="link-underline" target="_blank">iPlatinum Service</a> с&nbsp;ремонтом
          любой сложности и&nbsp;гарантией на&nbsp;работу в&nbsp;течение 100 дней
          по&nbsp;условиям официальных сервисных центров.
        </b>
      </p>
      <a href="https://service.iplatinum.ru/" class="text-decoration-none" target="_blank">
        <v-btn
          color="primary"
          class="btn btn-primary"
          depressed
        >
          В&nbsp;сервисный центр
        </v-btn>
      </a>
    </section>

    <Contacts />
  </v-container>
</template>

<script>
import Contacts from '@/components/Contacts.vue';

export default {
  name: 'GuaranteePage',
  components: {
    Contacts,
  },
}
</script>

<style scoped>
.guarantee-page .page-banner .banner-info {
  margin-top: 78px;
}

.guarantee-page .page-banner .banner-info h2 {
  margin-bottom: 30px;
}

.guarantee-page .page-banner .banner-info ul {
  margin: 0;
}

.guarantee-page .page-banner .banner-info ul li {
  margin-bottom: 10px;
}

.guarantee-page .page-banner .banner-info ul li:last-of-type {
  margin-bottom: 0;
}

.guarantee-page .page-banner .banner-image {
  align-items: flex-end;
}

.guarantee-page h2.page-heading {
  margin-bottom: 30px;
  text-align: left;
}

.guarantee-page .page-info-block {
  margin-bottom: 120px;
}

.guarantee-page .guarantee-page-content {
  max-width: 856px;
  margin: 0 auto;
  font-size: 18px;
  margin-bottom: 120px;
}

.guarantee-page .guarantee-page-content ul {
  margin: 0;
  margin-bottom: 50px;
}

.guarantee-page .guarantee-page-content ul li {
  margin-bottom: 10px;
}

.guarantee-page .guarantee-page-content p:last-of-type {
  margin-bottom: 30px;
}
</style>
