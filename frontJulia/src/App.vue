<template>
  <div id="app">
    <HeaderComponent/>
    <FormComponent msg="Welcome to google Schoolar search summary"/>
  </div>
</template>

<script>
import FormComponent from './components/FormComponent.vue'
import HeaderComponent from './components/Header.vue'

export default {
  name: 'App',
  components: {
    FormComponent,
    HeaderComponent
  }
}
</script>

<style>
html, body {
    height: 100%;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  background: #ecedf9;
  height: 100%;
}

</style>
