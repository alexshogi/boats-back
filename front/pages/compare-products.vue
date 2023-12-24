<template>
  <v-container class="common-page">
    <Gear />
  </v-container>
</template>

<script>
import Gear from '@/components/Gear.vue';

export default {
  components: {
    Gear,
  },
  data () {
    return {
      loading: false,
    }
  },
};
</script>

<style>

</style>
