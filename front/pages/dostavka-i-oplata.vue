<template>
  <v-container class="common-page delivery-page">
    <Gear />
    <!-- <section class="page-banner">
      <div class="banner-info">
        <h2>Доставка и оплата</h2>
        <p>
          Бесплатная доставка <b>по городу</b>
          <br>
          при заказе от 3 тысяч рублей.
        </p>
        <p>
          Бесплатная отправка <b>в регионы</b>
          <br>
          при заказе от 3 тысяч рублей.
        </p>
      </div>
      <div class="banner-more">
        <p>Стоимость доставки для заказов до 3 тысяч рублей рассчитывается индивидуально.</p>
      </div>
      <div class="banner-image">
        <img src="../static/images/delivery.png" alt="Delivery">
      </div>
    </section>

    <h2 class="page-heading">Способы оплаты:</h2>

    <ol class="custom-list">
      <li>
        <span class="number">1</span>
        <h4>Наличный расчёт</h4>
        <p>
          Расплатиться наличными можно лично с курьером,
          <br>
          когда он доставит заказ, либо в магазине.
        </p>
      </li>
      <li>
        <span class="number">2</span>
        <h4>Безналичный расчет</h4>
        <p>
          У нас доступна безналичная оплата картой,
          <br>
          переводом или оплата по QR-коду.
        </p>
      </li>
      <li>
        <span class="number">3</span>
        <h4>Кредит</h4>
        <p>
          Оформить данную услугу можно в более чем 10 банках при наличии
          <br>
          паспорта гражданина РФ и личном присутствии в магазине.
        </p>
      </li>
    </ol>

    <section class="page-info-block">
      <span>
        Оплата производится только после полной
        <br>
        проверки качества товара при курьере
      </span>
    </section>

    <Contacts /> -->
  </v-container>
</template>

<script>
import Contacts from '@/components/Contacts.vue';
import Gear from '@/components/Gear.vue';

export default {
  name: 'DeliveryPage',
  components: {
    Contacts,
    Gear,
  },
}
</script>

<style scoped>
.delivery-page h2.page-heading {
  margin-bottom: 70px;
  text-align: center;
}

.delivery-page ol.custom-list {
  max-width: fit-content;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 80px;
}

.delivery-page .page-info-block {
  margin-bottom: 120px;
}
</style>
