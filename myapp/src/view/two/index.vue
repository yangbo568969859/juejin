<template>
  <main class="containter">
    <div :class="['two-box', loginin?'welcome-view':'timeline-index-view']">
      <div class="two-content">
        <nav :class="{'view-nav':true,'view-top':st}">
          <ul>
            <li v-for="(v,i) in list" :key="i" class="small-nav li-item">
              <a>{{v.name}}</a>
            </li>
            <li class="more-city">
              <div class="txt">
                <span>其他</span>
              </div>
              <div class="menu">
                <span v-for="v in citylist" :key="v.id">{{v.cityName}}</span>
              </div>
            </li>
          </ul>
        </nav>
        <titlePicker/>
        <twoContent/>
        <!-- <div class="two-content-main"></div> -->
      </div>
    </div>
  </main>
</template>
<script>
import titlePicker from './components/titlePicker'
import twoContent from './components/twoContent'
export default {
  name:'two',
  data() {
    return {
      st: false,
      list:[
        {
          name:'热门活动',
          path:''
        },
        {
          name:'北京',
          path:''
        },
        {
          name:'杭州',
          path:''
        },
        {
          name:'上海',
          path:''
        },
        {
          name:'广州',
          path:''
        },
        {
          name:'深圳',
          path:''
        }
      ]
    }
  },
  components:{
    titlePicker,
    twoContent
  },
  methods:{
    // 控制顶部
    navFixed() {
      var st = document.documentElement.scrollTop || document.body.scrollTop
      st >= 400 ? this.st = true : this.st = false
    },
    // 获取城市数据
    getCityList() {
      try {
        this.$store.dispatch('getRequestAllowError', {
          name:'citylist'
        })
      } catch (error) {

      }
    }
  },
  computed:{
    loginin() {
      try {
        return this.$store.state.loginin;
      } catch (error) {
        return
      }
    },
    citylist() {
      try {
        let data = this.$store.state.citylist.data;
        return data;
      } catch (error) {

      }
    }
  },
  mounted() {
    window.addEventListener('scroll', this.navFixed)
    window.addEventListener('resize', this.navFixed)
    this.getCityList();
  }
}
</script>
<style lang="less">
main.containter{
  max-width:960px;
  width: 100%;
  margin:0 auto;
  position: relative;
}
.two-box{
  margin-top:20px;
}
.two-content{
  margin-top: 60px;
}
.view-nav ul li.more-city{
  position: relative;
  cursor: pointer;
  padding: 0 10px;
  margin-right: 10px;
  .txt{
    display: flex;
    align-items: center;
    span{
      margin-right: 5px;
    }
  }
  .txt::after{
    display: block;
    content: '';
    width: 0;
    height: 0;
    border-style:solid;
    border-width: 6px 6px 0;
    border-color: #72777b transparent transparent;
    transform-origin: center center;
    transition: transform .25s linear;
  }
  .menu{
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    min-width: 100px;
    background: #fff;
    box-shadow: 0 2px 6px 0 rgba(0,0,0,.15);
    border-radius: 3px;
    span{
      padding-left: 10px;
      display: block;
      height: 30px;
      line-height: 30px;
      font-size: 14px;
      cursor: pointer;
    }
    span:hover{
      color: #217c8e;
      background-color: #f9f9f9;
    }
  }
}
.view-nav ul li.more-city:hover{
  .txt{
    color: #217c8e;
  }
  .txt::after{
    transform: rotate(-180deg);
  }
  .menu{
    display: block;
  }
}
</style>
