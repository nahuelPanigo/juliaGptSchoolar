<template>
  <div class="form_container">
    <h1>{{ msg }}</h1>
    <div id="form">
    <span> In this section you can get a summary of documents, papers, book and other text of the specific topics you are looking for:</span>
    <b-form-textarea
      id="textarea"
      v-model="text"
      placeholder="Enter the topic you want to search..."
      rows="3"
      max-rows="6"
    ></b-form-textarea>
   </div>
   <div>
  <b-button block variant="primary" @click="sendToApi" id= "buttons">Send Data</b-button>
</div>
  </div>
</template>

<script>
export default {
  name: 'FormComponent',
  props: {
    msg: String,
  },
  methods: {
    sendToApi: function (event) {
      // `this` dentro de los métodos apunta a la instancia de Vue
      alert('Hola ' + this.name + '!')
      // `evento` es el evento DOM nativo
      if (event) {
        alert(event.target.tagName)
      }
    }
}
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

.form_container{
  margin-top: 2%;
}
#form{
  width: 98%;
  margin: 1%;
  margin-top: 5%;
}

</style>
