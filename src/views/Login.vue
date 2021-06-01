<template>
  <div>
    <b-row>
      <b-col></b-col>
      <b-col>
        <b-form @submit="onSubmit" @reset="onReset" v-if="show">
          <b-form-group
            id="input-group-1"
            label="Email address:"
            label-for="input-1"
            description="We'll never share your email with anyone else."
          >
            <b-form-input
              id="input-1"
              v-model="form.Email"
              type="email"
              placeholder="Enter email"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group
            id="input-group-2"
            label="Password:"
            label-for="input-2"
          >
            <b-form-input
              id="input-2"
              v-model="form.Password"
              placeholder="Enter password"
              type="password"
              required
            ></b-form-input>
          </b-form-group>

          <b-button
            type="submit"
            variant="primary"
            >Login</b-button
          >
          <b-button type="reset" variant="danger">Reset</b-button>
        </b-form>
      </b-col>
      <b-col></b-col>
    </b-row>
  </div>
</template>

<script>

import axios from "axios";
import servers from "../servers";
export default {
  data() {
    return {
      form: {
        Email: "",
        Password: "",
      },
      show: true,
    };
  },
  methods: {
    onSubmit(event) {
      event.preventDefault();
      axios
        .get(servers.orgvy_python + "user/login",{
          params:{
            Email: this.form.Email,
            Password: this.form.Password,
          }
        })
        .then((res) => {
          if (res.data.isLogin){
            this.$swal("Gracias por escogernos:3");
            this.$router.push("/bot");
          }else{
            this.$swal("Wey o correo o contraseña pero algo anda mal :v");
            this.onReset(null);
          }
          
          console.log();
        })
        .catch(() => {
          //this.$swal("Valió madres el login :v");
        });
    },
    onReset(event) {
      event.preventDefault();
      // Reset our form values
      this.form.Email = "";
      this.form.Password = "";
      // Trick to reset/clear native browser form validation state
      this.show = false;
      this.$nextTick(() => {
        this.show = true;
      });
    },
  },
};
</script>

<style>
</style>