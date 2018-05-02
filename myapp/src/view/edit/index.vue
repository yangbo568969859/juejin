<template>
  <div class="deit-box">
    <editor/>
  </div>
</template>
<script>
import editor from './components/editor.vue'
export default {
  name:'edit',
  data() {
    return {
      content:'',
    }
  },
  components:{
    editor
  }

}
</script>

<style lang="less">
  .deit-box{

  }
</style>
