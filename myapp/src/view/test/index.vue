<template>
  <div class="test">
    <div class="file-reader-com">
      <textarea v-model="text" name="" id="" cols="30" rows="10"></textarea>
      <file-reader @load="text = $event"></file-reader>
    </div>
  </div>
</template>
<script>
import fileReader from '@/components/drogupload/FileReader.vue';
export default {
  data() {
    return {
      text: ''
    }
  },
  components: {
    fileReader
  }
}
</script>
<style>
.file-reader-com{
  width: 300px;
}
</style>