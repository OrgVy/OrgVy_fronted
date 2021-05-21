// example-vue-component.vue
<template>
  <div>
    <b-alert show>Default Alert</b-alert>

    <b-alert variant="success" show>Success Alert</b-alert>

    <b-alert v-model="showDismissibleAlert" variant="danger" dismissible>
      Dismissible Alert!
    </b-alert>

    <b-alert
      :show="dismissCountDown"
      dismissible
      variant="warning"
      @dismissed="dismissCountDown=0"
      @dismiss-count-down="countDownChanged"
    >
      <p>This alert will dismiss after {{ dismissCountDown }} seconds...</p>
      <b-progress
        variant="warning"
        :max="dismissSecs"
        :value="dismissCountDown"
        height="4px"
      ></b-progress>
    </b-alert>

    <b-button @click="showAlert" variant="info" class="m-1">
      Show alert with count-down timer
    </b-button>
    <b-button @click="showDismissibleAlert=true" variant="info" class="m-1">
      Show dismissible alert ({{ showDismissibleAlert ? 'visible' : 'hidden' }})
    </b-button>
  <button @click="showAlert2">Hello world</button>
  </div>
</template>

<script>
import axios from 'axios';
import servers from '../servers'
export default {
  data() {
      return {
        dismissSecs: 10,
        dismissCountDown: 0,
        showDismissibleAlert: false
      }
    },
  methods: {
    countDownChanged(dismissCountDown) {
        this.dismissCountDown = dismissCountDown
      },
    showAlert() {
        this.dismissCountDown = this.dismissSecs
    },
    showAlert2() {
      // Use sweetalert2
      this.$swal('Hello Vue world!!!');
      
      axios.post(servers.orgvy_python + '/audiovisual/category/fromFront2')
        .then((result) => {
          console.log(result.data);
        }).catch((err) => {
          console.log(err);
        });
      axios.get(servers.orgvy_python + '/audiovisual/category')
        .then((result) => {
          console.log(result.data);
        }).catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>
