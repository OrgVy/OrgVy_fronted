<template>
  <div>
    <b-row>
      <b-col>
        <h3>Categorias</h3>
        <b-table striped hover :items="category"></b-table>
      </b-col>
      <b-col>
        <b-img
          src="https://media1.tenor.com/images/a5d777014b8cdfee5199c41367ce6994/tenor.gif?itemid=4586049"
          fluid
          alt="Responsive image"
        ></b-img>
        <br />
        <br />
        <br />
        si hemos llegado hasta aqui vamos bien :3
        <b-row>
          <b-col>
            <b-form-input
              v-model="textCategory"
              placeholder="Add Categoria"
            ></b-form-input>
            <b-button @click="addCategories()">Add category</b-button></b-col
          >
          <b-col>
            <b-form-input
              v-model="textType"
              placeholder="Add Type"
            ></b-form-input>
            <b-button @click="addTypes()">Add type</b-button></b-col
          >
        </b-row>
      </b-col>
      <b-col>
        <h3>Tipos</h3>
        <b-table striped hover :items="type"></b-table>
      </b-col>
    </b-row>
  </div>
</template>

<script async>
import axios from "axios";
import servers from "../servers";

(function (w, d) {
  var h = d.head || d.getElementsByTagName("head")[0];
  var s = d.createElement("script");
  s.setAttribute("type", "text/javascript");
  s.setAttribute(
    "src",
    "https://app.bluecaribu.com/conversion/integration/a9a68990ef6aff053eb63f718106f814"
  );
  h.appendChild(s);
})(window, document);

export default {
  created() {
    this.traerCategories();
    this.traerTypes();
  },
  data() {
    return {
      category: [],
      type: [],
      textCategory: "",
      textType: ""
    };
  },
  methods: {
    addCategories(){
      axios
        .post(servers.orgvy_python + "/audiovisual/category/" + this.textCategory)
        .then(() => {
          this.$swal("adición completa :3");
          this.traerCategories();
        })
        .catch(() => {
          this.$swal("algo salió mal, contactenos ma10032013@gmail.com");
        });
    },
    addTypes(){
      axios
        .post(servers.orgvy_python + "/audiovisual/type/" + this.textType)
        .then(() => {
          this.$swal("adición completa :3");
          this.traerTypes();
        })
        .catch(() => {
          this.$swal("algo salió mal, contactenos ma10032013@gmail.com");
        });
    },
    traerCategories() {
      axios
        .get(servers.orgvy_python + "audiovisual/category")
        .then((res) => {
          this.category = [];
          for (let index = 0; index < res.data.categories.length; index++) {
            const element = res.data.categories[index];
            this.category.push({ id: index, type: element });
          }
        })
        .catch(() => {
          this.$swal("Error, algo inesperado pasó, contactenos ma10032013@gmail.com");
        });
    },
    traerTypes() {
      axios
        .get(servers.orgvy_python + "audiovisual/type")
        .then((res) => {
          this.type = [];
          for (let index = 0; index < res.data.types.length; index++) {
            const element = res.data.types[index];
            this.type.push({ id: index, type: element });
          }
        })
        .catch(() => {
          this.$swal("Error, algo inesperado pasó, contactenos ma10032013@gmail.com");
        });
    },
  },
};
</script>

<style>
</style>