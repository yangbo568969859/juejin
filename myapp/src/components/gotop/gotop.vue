<template>
  <div class="gotop">
    <div class="gotop-box">
      <button class="gotop-btn gotop-one" @click="suggest()">
        <svg class="Zi Zi--Feedback" title="建议反馈" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M19.99 6.99L18 5s-1-1-2-1H8C7 4 6 5 6 5L4 7S3 8 3 9v9s0 2 2.002 2H19c2 0 2-2 2-2V9c0-1-1.01-2.01-1.01-2.01zM16.5 5.5L19 8H5l2.5-2.5h9zm-2 5.5s.5 0 .5.5-.5.5-.5.5h-5s-.5 0-.5-.5.5-.5.5-.5h5z"></path></svg>
      </button>
    </div>
    <div :class="{'gotop-box':true, 'gotop-box-hidden':st}">
      <button class="gotop-btn gotop-two" @click="gotop()">
        <svg class="Zi Zi--BackToTop" title="回到顶部" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M16.036 19.59a1 1 0 0 1-.997.995H9.032a.996.996 0 0 1-.997-.996v-7.005H5.03c-1.1 0-1.36-.633-.578-1.416L11.33 4.29a1.003 1.003 0 0 1 1.412 0l6.878 6.88c.782.78.523 1.415-.58 1.415h-3.004v7.005z"></path></svg>
      </button>
    </div>
    <!-- <back-top　:scrollmyself='true' /> -->
    <suggestBox :active="suggestShow" @submit="suggest"/>
  </div>
</template>
<script>
import suggestBox from './suggestBox.vue'
// import BackTop from './backTop.vue'
export default {
  data() {
    return {
      suggestShow:false,
      toTop: true,
      st: true
    }
  },
  watch: {
  },
  methods:{
    // 回到顶部
    gotop(e) {
      document.documentElement.scrollTop = document.body.scrollTop = 0;
    },
    // 建议弹窗
    suggest() {
      this.suggestShow=!this.suggestShow;
    },
    // 控制顶部
    navFixed() {
      var st = document.documentElement.scrollTop || document.body.scrollTop
      st >= 600 ? this.st = false : this.st = true
    }
  },
  mounted() {
    window.addEventListener('scroll', this.navFixed)
    window.addEventListener('resize', this.navFixed)
  },
  computed:{
  },
  components:{
    suggestBox,
    // BackTop
  }
}
</script>
<style lang="less">
.gotop{
  position: fixed;
  bottom: 0;
  right: 12px;
  display: flex;
  flex-direction: column;
  transition: transform .2s ease;
  z-index: 1000;
  .gotop-box{
    width: 40px;
    height: 52px;
    transition: height .2s ease;
    .gotop-btn:hover{
      background: #d3d3d3;
    }
    .gotop-btn{
      background: #fff;
      border-radius: 4px;
      width: 40px;
      height: 40px;
      box-shadow: 0 1px 3px rgba(26,26,26,.1);
      padding: 0;
      display: inline-block;
      color: #8590a6;
      text-align: center;
      cursor: pointer;
      font-size: 14px;
      outline: none;
      border:0;
    }
  }
  .gotop-box-hidden{
    height: 0;

  }
}
</style>
