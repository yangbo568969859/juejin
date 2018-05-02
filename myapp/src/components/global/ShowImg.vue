<template>
  <div v-if="active" class="image-viewer-box">
    <div class="image-viewer" @click="toggle()">
      <div :class="{'image-box':true,'isActive':active}">
        <img :src="imgUrl" alt="" ref="imgShow" :class="{'ImageView-img':true,'ImageView-img-active':active}">
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name:'ShowImg',
  props:['active', 'imgUrl'],
  data() {
    return {
      toggle() {
        this.$emit('toggle');
      }
    }
  },
  watch: {
    'active': function () {
      if (this.active == true) {
        console.log(this.$refs.imgShow);
      }
    }
  },
  mounted() {
    console.log(window.innerHeight, window.innerWidth);
    // window.addEventListener('scroll', this.navFixed)
  }
}
</script>

<style lang="less">
.image-viewer-box {

}
.image-viewer {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 10000;
  .isActive {
    background-color: rgba(26,26,26,.65);
  }
}
.image-box {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  line-height: 0;
  overflow: hidden;
  transition: background-color .2s ease-in-out;
  // img{
  //   position: absolute;
  //   transition: all .2s;
  //   cursor: zoom-out;
  // }
}
.ImageView-img {
  cursor: zoom-out;
  transition: transform .3s ease-in-out;
}
.ImageView-img-active {
   width: 654px;
    transform: translate3d(633px, 180.945px, 0px) scale3d(1.10092, 1.10092, 1);
    opacity: 1;
 }
</style>
