<template>
  <div class="product-card">
    <!-- <v-btn
      class="btn-fav"
      @click.stop.prevent="addToFavorites"
    >
      <Icon
        icon="heart"
        size="17"
        :class="{ 'active': isProductInFavorites }"
      />
    </v-btn> -->
    <div class="product-image">
      <div class="image" :style="`background-image: url(${product.image?.image?.url})`"></div>
    </div>
    <div class="product-info">
      <h4>{{ product.title }}</h4>
      <p class="product-vendor-code">{{ product.vendorCode }}</p>
      <div class="product-actions">
        <div class="d-flex">
          <v-rating
            :value="product.rating"
            background-color="#484848"
            color="#ffb800"
            readonly
            class="product-rating"
          />
          <span class="ratings-amount">{{ product.ratings }}</span>
        </div>
        <div class="btns-group">
          
        </div>
      </div>
      <div class="product-info-rest">
        <span class="product-old-price" v-if="product.oldPrice">{{ product.oldPrice.toLocaleString() }} ₽</span>
        <span class="product-price">{{ product.price?.toLocaleString() }} ₽</span>
        <!-- <p v-if="product.bonus" class="product-bonus">+ {{ product.bonus?.toLocaleString() }} на счет</p>
        <p v-else class="product-bonus">+ {{ bonus.toLocaleString() }} на счет</p> -->
      </div>
      <v-btn
        v-if="!isProductInCart"
        color="primary"
        class="btn medium btn-primary"
        depressed
        @click.stop.prevent="addToCart"
      >
        В корзину
      </v-btn>
      <p
        v-if="isProductInCart"
        class="in-cart"
      >
        В корзине
      </p>
      <v-btn
        v-if="!isProductInCart"
        class="btn medium btn-outline"
        depressed
        @click.stop.prevent="addToCart"
      >
        Подробнее
      </v-btn>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import Icon from '@/components/Icon.vue';

export default {
  name: 'ProductCard',
  components: {
    Icon,
  },
  props: {
    product: {
      type: Object,
      default: () => {},
    },
    loading: {
      type: Boolean,
      default: () => false,
    },
  },
  computed: {
    ...mapGetters({
      cartProducts: 'cartProducts',
      favoritesProducts: 'favoritesProducts',
      user: 'user',
      cart: 'cart',
    }),
    isProductInCart () {
      return this.cartProducts.some(p => p.id === this.product.id);
    },
    isProductInFavorites () {
      return this.favoritesProducts.some(p => p === this.product.id);
    },
    bonus () {
      return Math.round(this.product.price * 0.02);
    },
  },
  methods: {
    ...mapActions({
      addProductToCart: 'addProductToCart',
      addProductToFavorites: 'addProductToFavorites',
      removeProductFromFavorites: 'removeProductFromFavorites',
    }),
    addToCart () {
      this.addProductToCart({
        ...this.product,
        amount: 1
      });

      if (this.user?.id) {
        this.handleCart();
      }
    },
    addToFavorites () {
      if (this.isProductInFavorites) {
        this.removeProductFromFavorites(this.product);
      } else {
        this.addProductToFavorites(this.product);
      }

      if (this.user?.id) {
        // this.handleFavourites();
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
.product-card {
  position: relative;
  border-radius: 15px;
  border: 1px solid #e6e6e6;
  background-color: #f8f9fa;
  box-shadow: 0 1px 3px 0 rgba(230, 230, 230, 0.7);
  transition: background-color 0.24s;
  cursor: pointer;
  user-select: none;
  padding-bottom: 24px;
}
.v-application .product-card button.btn-fav {
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
.v-application .product-card button.btn-fav .icon.active svg {
  color: rgb(228, 59, 59);
}
.product-card .product-image {
  padding: 22px;
  margin-bottom: 0;
  display: flex;
  justify-content: center;
  min-height: 180px;
}
.product-card .product-image .image {
  background-repeat: no-repeat;
  background-size: contain;
  background-position: center;
  height: 100%;
  width: 100%;
  min-height: 180px;
}
.product-card .product-actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.product-card .product-rating {
  display: flex;
  align-items: center;
}
.product-card .product-rating .v-icon {
  font-size: 16px;
}
.product-card .ratings-amount {
  margin-top: 4px;
  margin-left: 8px;
  font-size: 13px;
  padding-bottom: 1px;
}
.product-card .product-info {
  text-align: left;
  padding: 0 20px;
}
.product-card .product-info h4 {
  margin-bottom: 5px;
  font-size: 16px;
  font-weight: 700;
  line-height: 21px;
  text-align: left;
}
.product-card .product-info .product-vendor-code {
  font-size: 10px;
  font-weight: 400;
  line-height: 13px;
  text-align: left;
  color: #b2b2b2;
  margin-bottom: 10px;
}
.product-card .product-info .product-info-rest {
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  flex: 1;
  height: 50px;
  min-height: 50px;
  max-height: 50px;
  margin-bottom: 8px;
}
.product-card .product-info .product-old-price {
  display: inline-block;
  font-size: 16px;
  line-height: 16px;
  font-weight: 400;
  margin-bottom: 4px;
  text-decoration: line-through;
}
.product-card .product-info .product-price {
  display: inline-block;
  font-size: 18px;
  line-height: 18px;
  font-weight: 700;
  margin: 0;
}
.product-card .product-info p {
  font-size: 14px;
  line-height: 16px;
  margin-bottom: 20px;
}
.product-card .product-info .btn {
  margin: 0;
  width: calc(100% - 24px);
  margin-bottom: 15px;
}
.product-card .product-info .btn:last-of-type {
  margin-bottom: 0;
}
.product-card .product-info .in-cart {
  margin-bottom: 0;
  line-height: 26px;
}
/* .product-card:hover {
  background-color: #e6e6e6;
} */
.product-card:hover .icon svg {
  color: #111111;
}
.v-application .product-card:hover button.btn-fav .icon.active svg {
  color: rgb(228, 59, 59);
}
.v-application .product-card:hover button.btn-fav .icon.active svg path {
  color: rgb(228, 59, 59);
}
.product-card:hover .product-info h4 {
  color: #111111;
}
.product-card:hover .product-info .product-price {
  color: #111111;
}
.v-rating {
  display: inline-block;
}
.v-rating .v-icon {
  padding: 0;
}
/* .product-card:hover .product-info p {
  color: #111111;
} */
/* .product-card:hover .product-info .btn {
  color: #111111;
  border-color: #111111;
} */

@media (max-width: 800px) {
  .product-card .product-image {
    padding: 35px 8px 10px 8px;
    margin-bottom: 0;
    display: flex;
    justify-content: center;
    min-height: 210px;
  }
  .product-card .product-image .image {
    background-repeat: no-repeat;
    background-size: contain;
    background-position: center;
    max-height: 170px;
    max-width: 160px;
    height: 170px;
    width: 100%;
  }
  .product-card .product-info h4 {
    font-size: 14px;
    line-height: 16px;
    font-weight: 400;
    margin-bottom: 15px;
    min-height: 48px;
    height: 48px;
    max-height: 48px;
    overflow: hidden;
    text-overflow: ellipsis;
  }
}
</style>
