<template>
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

    <div class="slider-button-prev">
      <Icon
        icon="chevron-left"
        size="16"
      />
    </div>
    <div class="slider-button-next">
      <Icon
        icon="chevron-right"
        size="16"
      />
    </div>
  </div>
</template>
  
<script>
import { Swiper, Navigation, Autoplay } from 'swiper';
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
    Swiper.use([Navigation, Autoplay]);
    new Swiper('.swiper-goods', {
      direction: 'horizontal',
      loop: true,
      modules: [Navigation, Autoplay],
      navigation: {
        nextEl: '.slider-goods .slider-button-next',
        prevEl: '.slider-goods .slider-button-prev',
      },
      autoplay: {
        delay: 150000,
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
          spaceBetween: 0,
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
  width: calc(100% - 100px);
}
.slider-goods .swiper-slide {
  display: flex;
  justify-content: center;
}
.slider .slider-button-prev,
.slider .slider-button-next {
  position: absolute;
  top: calc(50% - 32px);
  height: 32px;
  width: 32px;
  border-radius: 50%;
  border: 1px solid #e6e6e6;
  cursor: pointer;
  display: flex;
  justify-content: center;
  align-items: center;
}
.slider .slider-button-prev {
  left: 0;
  padding-right: 2px;
}
.slider .slider-button-next {
  right: 0;
  padding-left: 2px;
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
  width: 240px;
  padding-bottom: 0;
}

@media (max-width: 800px) {
  .slider .product-card {
    width: 100%;
    max-width: 240px;
  }
}
</style>
