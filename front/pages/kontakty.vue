<template>
  <v-container class="common-page contacts-page">
    <Gear />
  </v-container>
</template>

<script>
import Contacts from '@/components/Contacts.vue';
import Gear from '@/components/Gear.vue';

export default {
  name: 'GuaranteePage',
  components: {
    Contacts,
    Gear,
  },
}
</script>
