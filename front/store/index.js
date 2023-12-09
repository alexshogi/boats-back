import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

const store = () => new Vuex.Store({
  state: {
    user: {},
    authorised: false,
    sessionToken: '',
    cart: {
      id: '',
      products: [],
      services: [],
    },
    favorites: {
      id: '',
      products: [],
      services: [],
    },
    searchResults: [],
  },
  getters: {
    authorised: (state) => state.authorised,
    user: (state) => state.user,
    cart: (state) => state.cart,
    cartProducts: (state) => state.cart.products,
    cartProductsAmount: (state) => state.cart.products?.length,
    cartServices: (state) => state.cart.services,
    cartServicesAmount: (state) => state.cart.services?.length,
    favorites: (state) => state.favorites,
    favoritesProducts: (state) => state.favorites.products,
    favoritesProductsAmount: (state) => state.favorites.products?.length,
    favoritesServices: (state) => state.favorites.services,
    favoritesServicesAmount: (state) => state.favorites.services?.length,
    searchResults: (state) => state.searchResults,
  },
  mutations: {
    LOGIN(state, data) {
      state.user = data.user;
      state.sessionToken = data.sessionToken;
      state.authorised = true;
    },
    LOGOUT(state) {
      state.user = {};
      state.sessionToken = '';
      state.authorised = true;
    },
    ADD_PRODUCT_TO_CART(state, product) {
      state.cart.products = [ ...state.cart.products, product ];
    },
    ADD_SERVICE_TO_CART(state, service) {
      state.cart.services = [ ...state.cart.services, service ];
    },
    ADD_PRODUCTS_TO_CART(state, products) {
      state.cart.products = [ ...state.cart.products, ...products ];
    },
    REMOVE_PRODUCT_FROM_CART(state, productId) {
      state.cart.products = [ ...state.cart.products.filter(p => p.id !== productId) ];
    },
    REMOVE_SERVICE_FROM_CART(state, serviceId) {
      state.cart.services = [ ...state.cart.services.filter(s => s.id !== serviceId) ];
    },
    CLEAR_CART(state) {
      state.cart.products = [];
    },
    SET_CART_PRODUCT_AMOUNT(state, { id, amount }) {
      const product = state.cart.products.find(p => p.id === id);
      product.amount = amount;
    },
    SET_CART(state, cart) {
      state.cart = cart;
    },
    ADD_PRODUCT_TO_FAVORITES(state, productId) {
      state.favorites.products = [ ...state.favorites.products, productId ];
    },
    REMOVE_PRODUCT_FROM_FAVORITES(state, productId) {
      state.favorites.products = [ ...state.favorites.products.filter(p => p !== productId) ];
    },
    ADD_SERVICE_TO_FAVORITES(state, serviceId) {
      state.favorites.services = [ ...state.favorites.services, serviceId ];
    },
    REMOVE_SERVICE_FROM_FAVORITES(state, serviceId) {
      state.favorites.services = [ ...state.favorites.services.filter(s => s !== serviceId) ];
    },
    SET_SEARCH_RESULTS(state, results) {
      state.searchResults = [ ...results ];
    },
  },
  actions: {
    logout({ commit }) {
      commit('LOGOUT');

      localStorage.setItem('auth', null);
    },
    login({ commit }, data) {
      commit('LOGIN', data);

      localStorage.setItem('auth', JSON.stringify(data));
    },
    setCart({ commit }, cart) {
      commit('SET_CART', cart);
    },
    addProductToCart({ commit }, product) {
      const thinProduct = {
        id: product.id,
        amount: product.amount,
        price: product.price
      }

      commit('ADD_PRODUCT_TO_CART', thinProduct);
    },
    addServiceToCart({ commit }, service) {
      const thinService = {
        id: service.id,
        amount: 1,
        price: service.price
      }

      commit('ADD_SERVICE_TO_CART', thinService);
    },
    addProductsToCart({ commit }, products) {
      const thinProducts = [];

      for (const p of products) {
        thinProducts.push({
          id: p.id,
          amount: p.amount,
          price: p.price
        })
      }

      commit('ADD_PRODUCTS_TO_CART', thinProducts);
    },
    removeProductFromCart({ commit }, productId) {
      commit('REMOVE_PRODUCT_FROM_CART', productId);
    },
    removeServiceFromCart({ commit }, serviceId) {
      commit('REMOVE_SERVICE_FROM_CART', serviceId);
    },
    setCartProductAmount({ commit }, { id, amount }) {
      commit('SET_CART_PRODUCT_AMOUNT', { id, amount });
    },
    clearCart({ commit }) {
      commit('CLEAR_CART');
    },
    addProductToFavorites({ commit }, product) {
      commit('ADD_PRODUCT_TO_FAVORITES', product.id);
    },
    removeProductFromFavorites({ commit }, product) {
      commit('REMOVE_PRODUCT_FROM_FAVORITES', product.id);
    },
    addServiceToFavorites({ commit }, service) {
      commit('ADD_SERVICE_TO_FAVORITES', service.id);
    },
    removeServiceFromFavorites({ commit }, service) {
      commit('REMOVE_SERVICE_FROM_FAVORITES', service.id);
    },
    setSearchResults({ commit }, results) {
      commit('SET_SEARCH_RESULTS', results);
    },
  },
});

export default store;
