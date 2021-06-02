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
            label="Your Name:"
            label-for="input-2"
          >
            <b-form-input
              id="input-2"
              v-model="form.Name"
              placeholder="Enter name"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group
            id="input-group-3"
            label="Password:"
            label-for="input-3"
          >
            <b-form-input
              id="input-3"
              v-model="form.Password"
              placeholder="Enter password"
              type="password"
              required
            ></b-form-input>
            <br />
            <b-form-input
              id="input-4"
              v-model="form.Password2"
              placeholder="Enter password again"
              type="password"
              required
              @change="validar()"
            ></b-form-input>
          </b-form-group>

          <b-button
            :disabled.sync="form.Completed"
            type="submit"
            variant="primary"
            >Register</b-button
          >
          <b-button type="reset" variant="danger">Reset</b-button>
        </b-form>
        <!--
        <b-card class="mt-3" header="Form Data Result">
          <pre class="m-0">{{ form }}</pre>
        </b-card>
        -->
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
        Name: "",
        Password: "",
        Password2: "",
        Completed: true,
      },
      show: true,
    };
  },
  methods: {
    validar() {
      if (this.form.Password == this.form.Password2) {
        this.form.Completed = false;
      } else {
        this.form.Completed = true;
      }
    },
    onSubmit(event) {
      event.preventDefault();

      axios
        .post(servers.orgvy_python + "user",{
            Email: this.form.Email,
            Name: this.form.Name,
            Password: this.form.Password,
        })
        .then(() => {
          this.$swal("Registro completo :3");
          this.$router.push("/login");
        })
        .catch(() => {
          this.$swal("Coloque otro correo, si no funciona, contactenos ma10032013@gmail.com");
        });
    },
    onReset(event) {
      event.preventDefault();
      // Reset our form values
      this.form.Email = "";
      this.form.Name = "";
      this.form.Password = "";
      this.form.Password2 = "";
      this.form.Completed = "";
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