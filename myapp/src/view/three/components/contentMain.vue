<template>
  <div class="three-list-content">
    <div class="three-list-content-header">
      <span class="recommend">推荐</span>
      <span class="dingzhi" @click="customized()"><i class="iconfont icon-shezhi"></i>定制</span>
    </div>
    <div class="three-list-list">
      <ul>
        <li class="three-list-item" v-for="(v,i) in list" :key="i">
          <a :href="v.url" target="_black" rel="nofollow noopener noreferrer">
            <div class="three-img">
              <a :href="v.userUrl" target="_black" rel="nofollow noopener noreferrer">
                <img :src="v.userAvatarUrl" alt="">
              </a>
            </div>
            <div class="three-list-details">
              <div class="three-details-top">
                <span>{{v.userName}}</span>
                <span>/</span>
                <span>{{v.repoName}}</span>
              </div>
              <div class="three-details-middle">
                <div>{{v.description}}</div>
              </div>
              <div class="three-details-bottom">
                <span class="lang"><i class="iconfont icon-yuandianda" :style="{color:v.bgColor}"></i>{{v.language}}</span>
                <span class="star"><i class="iconfont icon-xingxing"></i>{{v.star}}</span>
                <span class="fork"><i class="iconfont icon-fork"></i>{{v.fork}}</span>
                <span class="time">{{v.updatedAt}}</span>
              </div>
            </div>
          </a>
        </li>
      </ul>
    </div>
    <!-- 定制页面组件 -->
    <customized :active="customizedShow" @submit="customized"/>
  </div>
</template>
<script>
import customized from './customized'
export default {
  data() {
    return {
      customizedShow: false,
      bgColor:{
        javascript:'red',
        python:'green'
      },
    }
  },
  components:{
    customized
  },
  methods:{
    customized() {
      this.customizedShow=!this.customizedShow;
      let body = document.querySelector('body');
      if (this.customizedShow) {
        body.style.overflow = 'hidden';
      } else {
        body.style.overflow = '';
      }
    },
    // 获取内容数据
    getContentMsg() {
      try {
        this.$store.dispatch('getRequestAllowError', {
          name:'customrepos'
        })
      } catch (error) {

      }
    }
  },
  mounted() {
    this.getContentMsg()
  },
  computed:{
    list() {
      try {
        let data = this.$store.state.customrepos.data;
        data.forEach(v => {
          switch (v.language.toLowerCase()) {
            case 'javascript':
              return v.bgColor = 'rgb(241, 224, 90)'
              break;
            case 'css':
              return v.bgColor = 'rgb(86, 61, 124)'
              break;
            case 'ruby':
              return v.bgColor = 'rgb(112, 21, 22)'
              break;
            case 'php':
              return v.bgColor = 'rgb(79, 93, 149)'
              break;
            case 'lua':
              return v.bgColor = 'rgb(53, 114, 165)'
              break;
            default:
              break;
          }
        })
        return data;
      } catch (error) {

      }
    }
  }
}
</script>
