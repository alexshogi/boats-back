<template>
  <v-container class="common-page about-page">
    <Gear />
    <!-- <section class="page-banner">
      <div class="banner-info">
        <h2>iPlatinum Store&nbsp;&mdash; магазин техники и&nbsp;аксессуаров в&nbsp;Калининграде</h2>
        <p>
          <b>Мы&nbsp;занимаемся продажей оригинальной продукции:</b>
          <br>
          телефоны, планшеты,
          ноутбуки и&nbsp;другие электронные устройств для вашего комфорта и&nbsp;удобства.
        </p>
      </div>
      <div class="banner-image">
        <img src="../static/images/about.png" alt="About">
      </div>
    </section>

    <section class="about-page-content">
      <h2 class="page-heading">iPlatinum Store&nbsp;&mdash; это:</h2>
      <ul>
        <li>Низкие цены</li>
        <li>Большой выбор</li>
        <li>Выгодный Trade-In</li>
        <li>Качественная техника и&nbsp;аксессуары</li>
        <li>Постоянные акции и&nbsp;специальные предложения</li>
        <li>Собственный сервисный центр iPlatinum Service с&nbsp;ремонтом любой сложности и&nbsp;гарантией на&nbsp;работу</li>
        <li>В&nbsp;подарок к&nbsp;любому ремонту&nbsp;&mdash; полноразмерное защитное стекло</li>
      </ul>

      <section class="page-info-block">
        <span>Поможем подобрать технику всего за&nbsp;15&nbsp;минут</span>
      </section>
    </section>

    <section class="page-about-exclamations">
      <h2>
        В&nbsp;iPlatinum Store вы&nbsp;найдёте необходимую технику по&nbsp;самым выгодным ценам.
        <br><br>
        У&nbsp;нас есть гарантия на&nbsp;лучшую цену Калининграда: если найдёте дешевле, то&nbsp;мы&nbsp;подарим скидку!
      </h2>
    </section>

    <Contacts /> -->
  </v-container>
</template>

<script>
import Contacts from '@/components/Contacts.vue';
import Gear from '@/components/Gear.vue';

export default {
  name: 'AboutPage',
  components: {
    Contacts,
    Gear,
  },
}
</script>

<style scoped>
.about-page .page-banner .banner-info {
  margin-top: 133px;
}

.about-page .page-banner .banner-info h2 {
  margin-bottom: 30px;
}

.about-page .about-page-content {
  max-width: 750px;
  margin: 0 auto;
  font-size: 18px;
  margin-bottom: 120px;
  margin: 0 auto;
}

.about-page .about-page-content h2 {
  font-size: 28px;
  font-weight: 700;
  line-height: 37px;
  text-align: left;
  margin: 0 auto;
  margin-bottom: 37px;
  max-width: 75%;
}

.about-page .about-page-content ul {
  margin: 0 auto;
  margin-bottom: 80px;
  list-style: none;
  max-width: 75%;
}

.about-page .about-page-content ul li {
  margin-bottom: 20px;
  position: relative;
  padding-left: 10px;
}

.about-page .about-page-content ul li:before {
  content: '';
  display: inline-block;
  height: 17px;
  width: 14px;
  position: absolute;
  background-image: url(../static/images/checkbox-checked.png);
  background-size: contain;
  background-repeat: no-repeat;
  left: -20px;
  top: calc(50% - 13px);
}

.about-page .page-info-block {
  margin-bottom: 120px;
  padding: 15px 25px;
}

.about-page .page-about-exclamations {
  max-width: 800px;
  margin: 0 auto;
  margin-bottom: 110px;
}
</style>
