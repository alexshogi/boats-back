<template>
  <section class="contacts">
    <div class="map">
      <iframe
        id="map-iframe"
        src="https://yandex.ru/map-widget/v1/?ll=20.517459%2C54.702126&amp;mode=geo&amp;oid=4661400667&amp;ol=biz&amp;z=15.89"
        frameborder="0"
        allowfullscreen="true"
        loading="lazy"
        style="position: relative;"
        class="border-radius--xxl contacts-map">
      </iframe>
    </div>
    <div class="contacts-info">
      <h3>Где нас найти</h3>
      <p>
        ул. Октябрьская, 37, Калининград,
        <br>
        Калининградская обл., 236006
      </p>
      <h3>Время работы</h3>
      <p>
        Пн-пт: 10:00 - 20:00
      </p>
      <p>
        Сб-вс: 10:00 - 19:00
      </p>
      <h3>Как с нами связаться</h3>
      <p>
        Контактный телефон:
        <a href="tel:+79527995333">+7 (952) 799-53-33</a>
      </p>
      <div class="socials">
        <a href="https://vk.com/iplatinumstoreservice39" target="_blank">
          <img src="../static/images/icon-vk.svg" alt="VK">
        </a>
        <a href="https://t.me/iPlatinumStore" target="_blank">
          <img src="../static/images/icon-telegram.svg" alt="TG">
        </a>
        <a class="link-instagram" href="https://www.instagram.com/iplatinum_service/" target="_blank">
          <img src="../static/images/icon-instagram.svg" alt="IG">
        </a>
        <a href="https://www.avito.ru/brands/i163601381/" target="_blank">
          <img src="../static/images/icon-avito.svg" alt="Avito">
        </a>
        <p class="note">
          * Instagram — проект Meta Platforms Inc.,
          <br>
          деятельность которой в России запрещена
        </p>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'Contacts',
}
</script>

<style scoped>
.contacts {
  display: flex;
  gap: 60px;
}
.map {
  height: 480px;
  min-width: 700px;
  width: 700px;
  max-width: 700px;
  border-radius: 35px;
  overflow: hidden;
}
.map iframe {
  height: 100%;
  width: 100%;
}
.contacts-info h3 {
  font-size: 28px;
  line-height: 30px;
  font-weight: 600;
  margin-bottom: 15px;
  margin-top: 30px;
}
.contacts-info h3:first-of-type {
  margin-top: 0;
}
.contacts-info p {
  font-size: 18px;
  line-height: 24px;
  font-weight: 400;
  margin-bottom: 15px;
}
.contacts-info a {
  text-decoration: none;
}
.contacts-info .socials {
  margin-top: 48px;
}
.contacts-info .socials a {
  margin-right: 15px;
  text-decoration: none;
  display: inline-block;
}
.contacts-info .socials a:last-of-type {
  margin-right: 0;
}
.contacts-info .socials a img {
  height: 28px;
}
.contacts-info .socials .note {
  font-size: 11px;
  line-height: 14px;
  margin-top: 15px;
}
.contacts-info .socials a.link-instagram {
  position: relative;
  margin-right: 25px;
}
.contacts-info .socials a.link-instagram:after {
  content: "*";
  position: absolute;
  top: 0;
  right: -10px;
  font-size: 18px;
}

@media (max-width: 800px) {
.contacts {
  flex-direction: column;
  gap: 40px;
}
.map {
  height: 220px;
  min-width: 100%;
  width: 100%;
  max-width: 100%;
  border-radius: 0;
  overflow: hidden;
}
.contacts-info {
  padding: 8px 24px;
}
.contacts-info h3 {
  font-size: 15px;
  line-height: 20px;
  font-weight: 600;
  margin-bottom: 5px;
  margin-top: 20px;
}
.contacts-info h3:first-of-type {
  margin-top: 0;
}
.contacts-info p {
  font-size: 13px;
  line-height: 17px;
  font-weight: 400;
  margin-bottom: 5px;
}
.contacts-info a {
  text-decoration: none;
}
.contacts-info .socials {
  margin-top: 25px;
}
.contacts-info .socials a {
  margin-right: 15px;
  text-decoration: none;
  display: inline-block;
}
.contacts-info .socials a:last-of-type {
  margin-right: 0;
}
.contacts-info .socials a img {
  height: 26px;
}
.contacts-info .socials .note {
  font-size: 8px;
  line-height: 8px;
  margin-top: 5px;
}
.contacts-info .socials a.link-instagram {
  position: relative;
  margin-right: 25px;
}
.contacts-info .socials a.link-instagram:after {
  content: "*";
  position: absolute;
  top: -3px;
  right: -10px;
  font-size: 14px;
}
}
</style>
