<template>
  <div class="product-card">
    <v-btn
      class="btn-fav"
      @click.stop.prevent="addToFavorites"
    >
      <Icon
        icon="heart"
        size="17"
        :class="{ 'active': isProductInFavorites }"
      />
    </v-btn>
    <div class="product-image">
      <div class="image" :style="`background-image: url(${product.image?.image?.url})`"></div>
    </div>
    <div class="product-info">
      <h4>{{ product.parent || product.title }}</h4>
      <div class="product-info-rest">
        <span class="product-price">{{ product.price?.toLocaleString() }} ₽</span>
        <p v-if="product.bonus" class="product-bonus">+ {{ product.bonus?.toLocaleString() }} на счет</p>
        <p v-else class="product-bonus">+ {{ bonus.toLocaleString() }} на счет</p>
        <v-btn
          v-if="!isProductInCart"
          class="btn btn-outline small"
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
      </div>
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
  background-color: transparent;
  box-shadow: 0 1px 3px 0 rgba(230, 230, 230, 0.7);
  transition: background-color 0.24s;
  cursor: pointer;
  user-select: none;
  padding-bottom: 40px;
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
  padding: 20px 8px 5px 8px;
  margin-bottom: 0;
  display: flex;
  justify-content: center;
  min-height: 240px;
}
.product-card .product-image .image {
  background-repeat: no-repeat;
  background-size: contain;
  background-position: center;
  max-height: 200px;
  max-width: 160px;
  height: 200px;
  width: 100%;
}
.product-card .product-info {
  text-align: center;
  padding: 0 8px;
}
.product-card .product-info h4 {
  font-size: 13px;
  line-height: 15px;
  font-weight: 400;
  margin-bottom: 15px;
  min-height: 45px;
  max-height: 45px;
  overflow-y: hidden;
}
.product-card .product-info .product-info-rest {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  flex: 1;
}
.product-card .product-info .product-price {
  display: inline-block;
  font-size: 18px;
  line-height: 20px;
  font-weight: 600;
  margin-bottom: 8px;
}
.product-card .product-info p {
  font-size: 14px;
  line-height: 16px;
  margin-bottom: 20px;
}
.product-card .product-info .btn {
  margin: 0 auto;
}
.product-card .product-info .in-cart {
  margin-bottom: 0;
  line-height: 26px;
}
.product-card:hover {
  background-color: #e6e6e6;
}
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
.product-card:hover .product-info p {
  color: #111111;
}
.product-card:hover .product-info .btn {
  color: #111111;
  border-color: #111111;
}

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
