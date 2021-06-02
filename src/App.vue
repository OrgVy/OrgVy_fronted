<template>
  <div id="app" :style="{'background-image':'url(https://thumbs.dreamstime.com/z/fond-bleu-pastel-lumineux-de-couleur-utilisation-l-application-emballage-les-produits-sites-web-et-du-mat%C3%A9riel-illustration-168231031.jpg)'}">
    <div id="nav">
      <router-link to="/">Registro</router-link> |
      <router-link to="/login">Login</router-link>
    </div>
    <router-view/>
  </div>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
