<template>
  <div class="file-reader">
    <label class="text-reader">
      Read FileReader
      <input type="file" @change="loadTextFormFile" />
    </label>
  </div>
</template>

<script>
export default {
  name: 'FileReader',
  data() {
    return {

    }
  },
  methods: {
    loadTextFormFile(e) {
      const file = e.target.files[0];
      const reader = new FileReader();

      reader.onload = e => this.$emit('load', e.target.result)
      reader.readAsText(file);
    }
  }
}
</script>
<style lang="less">
.text-reader {
  position: relative;
  overflow: hidden;
  display: inline-block;
  border: 2px solid black;
  border-radius: 5px;
  padding: 8px 12px;
  cursor: pointer;
  color: #333;
  float: right;
  input {
    position: absolute;
    top: 0;
    left: 0;
    z-index: -1;
    opacity: 0;
  }
}

textarea {
  width: 100%;
  min-height: 80px;
  margin-bottom: 20px;
  position: relative;
  text-align: left;
  border-radius: 3px;
  background: #fff;
  letter-spacing: 2px;
  transition: all ease-in 0.3s;
  border: 1px solid #bdcce6;
  display: block;
  resize: vertical;
}
</style>
