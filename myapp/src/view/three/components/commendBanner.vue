<template>
  <div class="three-banner" v-if="list">
    <ul :style="{width:list.length*100+'%' , transform: 'translate3d'+'('+-leftPercent+'%'+', 0px, 0px)'}">
      <li class="three-banner-li" v-for="(v,i) in list" :key="i" :style="{width:100/list.length+'%'}">
        <a href="">
          <div class="three-banner-thumb" v-if="v.screenshot!=null" :style="{backgroundImage:'url('+v.screenshot+')'}"></div>
          <div class="three-banner-box">
            <div class="three-banner-box-title">{{v.title}}</div>
            <div class="three-banner-box-content">{{v.content}}</div>
          </div>
        </a>
      </li>
    </ul>
    <div class="three-arrow three-left-arrow" @click="arrowRight()">
      <i class="iconfont icon-zuojiantou"></i>
    </div>
    <div class="three-arrow three-right-arrow" @click="arrowLeft()">
      <i class="iconfont icon-youjiantou"></i>
    </div>
  </div>
</template>
<script>
export default {
  name:'commendBanner',
  data() {
    return {
      left:'',
      leftNum:0,
      leftPercent:0
    }
  },
  methods:{
    arrowLeft() {
      if (this.leftNum >= this.list.length-1) {
        this.leftNum=0;
      } else {
        this.leftNum++
      }
      this.leftPercent=this.leftNum*(100/this.list.length)
    },
    arrowRight() {
      if (this.leftNum < 1) {
        this.leftNum=this.list.length-1;
      } else {
        this.leftNum--
      }
      this.leftPercent=this.leftNum*(100/this.list.length)
    },
    // 进来就执行
    digui() {
      let zidigui= () => {
        setTimeout(() => {
          this.leftNum = this.leftNum++
          this.leftPercent=this.leftNum*(100/this.list.length)
          zidigui()
        }, 1000);
      }
    },
    // 获取banner列表
    getBannerList() {
      try {
        this.$store.dispatch('getRequestAllowError', {
          name:'bannerlist'
        })
      } catch (error) {

      }
    },
  },
  mounted() {
    this.digui();
    this.getBannerList()
  },
  computed:{
    list() {
      try {
        return this.$store.state.bannerlist.data;
      } catch (error) {

      }
    }
  }
}
</script>
<style lang="less">
.three-banner{
  position: relative;
  height: 12rem;
  background-color: #fff;
  overflow: hidden;
  margin-bottom: 30px;
  border-radius: 2px;
  ul{
    // width: 500%;
    height: 100%;
    transition: transform .3s,-webkit-transform .3s;
    overflow: hidden;
    position: relative;
  }
}
.three-banner-li{
  width: 20%;
  height: 100%;
  float: left;
  a{
    display: flex;
    height: 100%;
    padding:20px 40px;
  }
}
.three-banner-thumb{
  flex: 0 0 auto;
  width: 140px;
  height: 100%;
  background-position: 50%;
  background-repeat: no-repeat;
  background-size: cover;
  margin-right: 10px;
}
.three-banner-box{
  display: flex;
  flex-direction: column;
  justify-content: center;
}
.three-banner-box-title{
  color: #2e3135;
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 10px;
}
.three-banner-box-content{
  max-height: 3em;
  color: #2e3135;
  display: -webkit-box;
  overflow: hidden;
  text-overflow: ellipsis;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  font-size: 14px;
  opacity: .7;
}
.three-banner:hover{
  .three-arrow{
    i{
      opacity: .4;
    }
  }

}
.three-arrow{
  position: absolute;
  top: 0;
  height: 100%;
  width: 50px;
  display: flex;
  align-items:center;
  justify-content: center;
  cursor: pointer;
  i{
    color: #000;
    font-size: 18px;
    font-weight: 600;
    opacity: 0;
    transition: all .2s ease-in-out;
  }
}
.three-arrow:hover{
  i{
    opacity: 0.5;
  }
}
.three-left-arrow{
  left: 0;
}
.three-right-arrow{
  right: 0;
}
</style>
