<template>
  <div class="slider">
    <div class="swiper swiper-main">
      <div class="swiper-wrapper">
        <!-- Slide 1 -->
        <div
          class="swiper-slide"
          style="background-image: url(/images/slider_iphone_14_pro.png);"
        >
          <h2>
            iPlatinum Store
            <br>
            Магазин техники в&nbsp;Калининграде
          </h2>
          <p>гарантируем лучшую цену в&nbsp;городе</p>
        </div>
        <!-- Slide 2 -->
        <!-- <div
          class="swiper-slide"
          style="background-image: url(/images/slider_iphone_14_pro.png);"
        >
          <h2>
            iPlatinum Store
            <br>
            Магазин техники в&nbsp;Калининграде
          </h2>
          <p>гарантируем лучшую цену в&nbsp;городе</p>
        </div> -->
        <!-- Slide 3 -->
        <!-- <div
          class="swiper-slide"
          style="background-image: url(/images/slider_iphone_14_pro.png);"
        >
          <h2>
            iPlatinum Store
            <br>
            Магазин техники в&nbsp;Калининграде
          </h2>
          <p>гарантируем лучшую цену в&nbsp;городе</p>
        </div> -->
      </div>      
    </div>

    <div class="swiper-pagination"></div>
  </div>
</template>

<script>
import { Swiper, Pagination, Autoplay } from 'swiper'
import 'swiper/swiper-bundle.min.css'

export default {
  name: 'SliderMain',
  mounted() {
    Swiper.use([Pagination, Autoplay]);
    const swiperMain = new Swiper('.swiper-main', {
      direction: 'horizontal',
      loop: true,
      modules: [Pagination, Autoplay],
      pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true,
      },
      autoplay: {
        delay: 999999999,
      },
      slidesPerView: 'auto',
    });
  },
}
</script>

<style scoped>
.swiper {
  height: 630px;
  overflow: hidden;
  position: relative;
  width: 100%;
  border-radius: 30px;
  border: 1px solid #e6e6e6;
}
.swiper-slide {
  padding: 205px 75px;
  text-align: left;
  box-sizing: border-box;
  border-radius: 30px;
  background-position: right bottom;
  background-size: 46%;
  background-repeat: no-repeat;
}
.swiper-slide h2 {
  margin-bottom: 20px;
  width: fit-content;
}
.swiper-slide p {
  font-size: 20px;
  width: fit-content;
}
.swiper-pagination {
  margin-top: 40px;
  width: 100%;
  display: flex;
  justify-content: center;
  position: unset;
  gap: 12px;
}

@media (max-width: 800px) {
  .swiper {
    height: 410px;
  }
  .swiper-slide {
    padding: 30px;
    background-position: right bottom;
    background-size: 70%;
  }
  .swiper-slide h2,
  .swiper-slide p {
    margin-bottom: 10px;
    font-size: 15px;
    line-height: 20px;
    width: fit-content;
    max-width: 60%;
  }
}
</style>
