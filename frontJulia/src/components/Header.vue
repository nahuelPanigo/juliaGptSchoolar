<template>
<div id = "header">
<div  id="images"> 
    <img alt="Julia logo" src="../assets/julia_logotype.svg" id= "logo_julia" class="logos">
    <img alt="Gpt logo" src="../assets/ChatGPT_logo.png" id= "logo_gpt" class="logos">
</div>
</div>
</template>


<script>
export default {
  name: 'HeaderComponent'
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

#header{
  background: #d9d2f3;  
}

#logo_julia{
  width: 15%;
}

#logo_gpt{
  width : 6%;
}

.logos{
  margin : 0.5%
}


</style>
