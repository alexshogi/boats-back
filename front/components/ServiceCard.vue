<template>
  <div
    class="service-card"
    :class="{ flip: flip }"
  >
    <div class="content">
      <div class="front">
        <v-btn
          class="btn-fav"
          @click.stop.prevent="addToFavorites"
        >
          <Icon
            icon="heart"
            size="17"
            :class="{ 'active': isServiceInFavorites }"
          />
        </v-btn>
        <div class="service-image">
          <div class="image" :style="{ backgroundImage: `url(../images/services/${service.code}.png)` }"></div>
        </div>
        <div class="service-info">
          <h4>{{ service.title }}</h4>
          <div class="service-info-rest">
            <span class="service-price">{{ service.price?.toLocaleString() }} ₽</span>
            <div class="service-info-actions">
              <v-btn
                v-if="!isServiceInCart"
                class="btn btn-outline small"
                depressed
                @click.stop.prevent="addToCart"
              >
                В корзину
              </v-btn>
              <p
                v-if="isServiceInCart"
                class="in-cart"
              >
                В корзине
              </p>

              <v-btn
                class="btn btn-outline small"
                depressed
                @click.stop.prevent="showMore"
              >
                Подробнее
              </v-btn>
            </div>
          </div>
        </div>
      </div>
      <div class="back">
        <v-btn
          class="btn-fav"
          @click.stop.prevent="addToFavorites"
        >
          <Icon
            icon="heart"
            size="17"
            :class="{ 'active': isServiceInFavorites }"
          />
        </v-btn>
        <div class="service-info">
          <h4>{{ service.title }}</h4>
          <p>{{ service.caption }}</p>
          <div class="service-info-rest">
            <span class="service-price">{{ service.price?.toLocaleString() }} ₽</span>
            <div class="service-info-actions">
              <v-btn
                v-if="!isServiceInCart"
                class="btn btn-outline small"
                depressed
                @click.stop.prevent="addToCart"
              >
                В корзину
              </v-btn>
              <p
                v-if="isServiceInCart"
                class="in-cart"
              >
                В корзине
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import Icon from '@/components/Icon.vue';

export default {
  name: 'ServiceCard',
  components: {
    Icon,
  },
  props: {
    service: {
      type: Object,
      default: () => {},
    },
    loading: {
      type: Boolean,
      default: () => false,
    },
  },
  data () {
    return {
      flip: false,
    }
  },
  computed: {
    ...mapGetters({
      cartProducts: 'cartProducts',
      cartServices: 'cartServices',
      favoritesProducts: 'favoritesProducts',
      favoritesServices: 'favoritesServices',
      user: 'user',
      cart: 'cart',
    }),
    isServiceInCart () {
      return this.cartServices.some(s => s.id === this.service.id);
    },
    isServiceInFavorites () {
      return this.favoritesServices.some(s => s === this.service.id);
    },
  },
  methods: {
    ...mapActions({
      addServiceToCart: 'addServiceToCart',
      addServiceToFavorites: 'addServiceToFavorites',
      removeServiceFromFavorites: 'removeServiceFromFavorites',
    }),
    showMore () {
      this.flip = true;

      setTimeout(() => {
        this.flip = false;
      }, 10000);
    },
    addToCart () {
      this.addServiceToCart(this.service);

      if (this.user?.id) {
        this.handleCart();
      }
    },
    addToFavorites () {
      if (this.isServiceInFavorites) {
        this.removeServiceFromFavorites(this.service);
      } else {
        this.addServiceToFavorites(this.service);
      }

      if (this.user?.id) {
        // this.handleFavorites();
      }
    },
    async handleCart () {
      const graphqlQuery = {
        query: `
          query {
            cart (
              where: {
                userId: "${this.user.id}"
              }
            ) {
              id
              products
              userId
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });

      const cart = response?.data?.data?.cart;

      if (cart) {
        this.updateCart();
      } else {
        this.createCart();
      }
    },
    async createCart () {
      if (!this.user?.id) {
        return;
      }

      const graphqlQuery = {
        query: `
          mutation {
            createCart (
              data: {
                products: "${JSON.stringify(this.cartProducts).replace(/"/g, '\'')}",
                userId: "${this.user.id}"
              }
            ) {
              id
              products
              userId
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });
    },
    async updateCart () {
      if (!this.user?.id) {
        return;
      }

      const graphqlQuery = {
        query: `
          mutation {
            updateCart (
              where: {
                id: "${this.cart.id}"
              }
              data: {
                products: "${JSON.stringify(this.cartProducts).replace(/"/g, '\'')}"
              }
            ) {
              id
              products
              userId
            }
          }
        `
      };

      const response = await this.$axios({
        method: 'POST',
        data: JSON.stringify(graphqlQuery)
      });
    },
  },
}
</script>

<style>
.service-card {
  position: relative;
  border-radius: 15px;
  background-color: transparent;
  cursor: pointer;
  user-select: none;
  padding-bottom: 20px;
  perspective: 700px;
  min-height: 430px;
}
.v-application .service-card button.btn-fav {
  position: absolute;
  z-index: 15;
  height: 30px;
  width: 30px;
  min-width: 30px;
  max-width: 30px;
  max-height: 30px;
  min-height: 30px;
  padding: 0;
  top: 5px;
  right: 5px;
  border-radius: 10px;
  box-shadow: none;
  background: transparent;
}
.v-application .service-card button.btn-fav .icon.active svg {
  color: rgb(228, 59, 59);
}
.service-card .service-image {
  padding: 20px 8px 5px 8px;
  margin-bottom: 0;
  display: flex;
  justify-content: center;
  min-height: 240px;
  background-image: radial-gradient(circle, rgba(130, 151, 172, 0.2) 0%, rgba(0, 0, 0, 0) 65%, rgba(0, 0, 0, 0) 100%);
}
.service-card .service-image .image {
  background-repeat: no-repeat;
  background-size: contain;
  background-position: center;
  max-height: 200px;
  max-width: 160px;
  height: 200px;
  width: 100%;
}
.service-card .service-info {
  text-align: center;
  padding: 0 8px;
}
.service-card .service-info h4 {
  font-size: 13px;
  line-height: 15px;
  font-weight: 400;
  margin-bottom: 8px;
  min-height: 32px;
}
.service-card .service-info .service-info-rest {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  flex: 1;
}
.service-card .service-info .service-price {
  display: inline-block;
  font-size: 18px;
  line-height: 20px;
  font-weight: 600;
  margin-bottom: 32px;
}
.service-card .service-info p {
  font-size: 14px;
  line-height: 16px;
  margin-bottom: 20px;
}
.service-card .service-info .btn {
  margin: 0 auto;
  width: 120px;
  margin-bottom: 15px;
  display: flex;
  justify-content: center;
  align-items: center;
}
.service-card .service-info .btn:last-of-type {
  margin-bottom: 0;
}
.service-card .service-info .in-cart {
  margin-bottom: 0;
  line-height: 27px;
  margin-bottom: 15px;
}

.content {
  position: absolute;
  width: 100%;
  height: 100%;
  border-radius: inherit;
  transition: transform 0.25s;
  transform-style: preserve-3d;
}

.service-card.flip .content {
  transform: rotateY(180deg) ;
  transition: transform 0.28s;
}

.front,
.back {
  position: absolute;
  height: 100%;
  width: 100%;
  background: transparent;
  backface-visibility: hidden;
  border-radius: 15px;
  box-shadow: 0 1px 3px 0 rgba(230, 230, 230, 0.7);
}

.front {
  border: 1px solid #e6e6e6;
}

.back {
  background: #f6f6f6;
  transform: rotateY(180deg);
  color: #111111;
}

.back .service-info {
  padding: 40px 16px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  height: 100%;
}

.back .service-info .btn-outline {
  color: #111111 !important;
  border-color: #111111 !important;
}

.service-card.flip .icon svg {
  color: #111111;
}

.v-application .service-card.flip button.btn-fav .icon.active svg {
  color: rgb(228, 59, 59);
}

.v-application .service-card.flip button.btn-fav .icon.active svg path {
  color: rgb(228, 59, 59);
}

/* .service-card:hover .service-info h4 {
  color: #111111;
} */

/* .service-card:hover .service-info .service-price {
  color: #111111;
} */

/* .service-card:hover .service-info p {
  color: #111111;
} */

/* .service-card:hover .service-info .btn {
  color: #111111;
  border-color: #111111;
} */
</style>
