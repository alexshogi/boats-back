`<template>
  <div class="slider slider-goods">
    <div class="swiper swiper-goods">
      <div class="swiper-wrapper">
        <div
          v-for="product in products"
          :key="product.id"
          class="swiper-slide"
        >
          <NuxtLink
            :to="`/catalog/${product.link}`"
            class="text-decoration-none"
          >
            <ProductCard
              :product="product"
            />
          </NuxtLink>
        </div>
      </div>
    </div>
  </div>
</template>
  
<script>
import { Swiper, Autoplay } from 'swiper';
import 'swiper/swiper-bundle.min.css';
import ProductCard from '@/components/goods/ProductCard.vue';
import Icon from '@/components/Icon.vue';

export default {
  name: 'SliderGoods',
  props: {
    products: {
      type: Array,
      default: () => [],
    },
    loading: {
      type: Boolean,
      default: () => false,
    },
  },
  components: {
    ProductCard,
    Icon,
  },
  data () {
    return {
      id: null,
    }
  }, 
  mounted() {
    this.id = this._uid;
    Swiper.use([Autoplay]);
    new Swiper('.swiper-goods', {
      direction: 'horizontal',
      loop: true,
      modules: [Autoplay],
      autoplay: {
        delay: 60000,
      },
      slidesPerView: 3,
      spaceBetween: 0,
      breakpoints: {
        100: {
          slidesPerView: 1,
          spaceBetween: 50,
        },
        700: {
          slidesPerView: 2,
          spaceBetween: 40,
        },
        1024: {
          slidesPerView: 3,
          spaceBetween: 25,
        },
      },
    });
  },
}
</script>
  
<style scoped>
.slider {
  position: relative;
  display: flex;
  justify-content: center;
}
.slider .swiper {
  width: 100%;
}
.slider-goods .swiper-slide {
  display: flex;
  justify-content: center;
  width: 100%;
}
.slider-goods .swiper-slide > a {
  width: 100%;
}
.swiper-goods {
  height: 470px;
  overflow: hidden;
  position: relative;
  width: 100%;
  padding: 0 8px;
}
.slider .product-card {
  height: calc(100% - 5px);
  width: 100%;
  padding-bottom: 0;
}

@media (max-width: 800px) {
  .slider .product-card {
    width: 100%;
    max-width: 240px;
  }
}
</style>
